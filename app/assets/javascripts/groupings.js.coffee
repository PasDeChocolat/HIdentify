# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = global ? window

loadGroupingPage = ->
  return unless $('#grouping').exists()

  # put "contribution/:contribution_id/search_token/:search_token" => 'contribution_search#match_add', as: :match_add
  addMatch = (groupingId, contribId, searchToken) ->
    $.ajax(
      url: "/contribution/"+contribId+"/grouping/"+groupingId+".json",
      dataType: "json",
      type: "PUT",
      data: {'criteria': JSON.stringify(searchToken)},
      success: (data, textStatus, jqXHR) ->
        console.log 'add match complete'
      ,
      error: (jqXHR, status, error) ->
        console.log "Failed to load data for search token: "+searchToken+ " contrib ID: "+contribId
      )

  removeSavedMatchRow = (row) ->
    matchId = row.data('match-id')
    $.ajax(
      url: "/matches/"+matchId+".json",
      dataType: "json",
      type: "DELETE",
      success: (data, textStatus, jqXHR) ->
        console.log 'remove saved match complete'
        row.remove()
      ,
      error: (jqXHR, status, error) ->
        console.log "Failed to destroy saved match: "+matchId
      )

  searchResultMatchChecked = (e) ->
    e.preventDefault()
    checkBox = $(e.currentTarget)
    isChecked = checkBox.is(':checked')
    contributionId = checkBox.data('contrib-id')
    searchToken = checkBox.data('search-token')
    groupingId = $('#grouping').data('grouping-id')
    if isChecked
      addMatch(groupingId, contributionId, searchToken)
    else
      row = checkBox.closest('tr')
      removeSavedMatchRow(row)


  clearSearchResults = ->
    $("#search-result-body").empty()

  genSearchResultFn = (searchToken) ->
    (searchResult) ->
      candidateName   = searchResult['candidate_name']
      office           = searchResult['office']
      contributorName = searchResult['contributor_name']
      contributorAddr = searchResult['formatted_full_address']
      electionPeriod = searchResult['election_period']
      contribAmount = searchResult['amount']
      contribAgg = searchResult['aggregate']
      contributionId = searchResult['id']
      matched = searchResult['is_matched']
      matchId = searchResult['match_id']
      row = "<tr"
      if matchId?
        row += " data-match-id='"+(matchId)+"'"
      row += "><td><input class='search-result-match' type='checkbox' data-contrib-id='"+contributionId+"' data-search-token='"+searchToken+"'"
      row += " CHECKED" if matched
      row += ">"+
             "</td><td>"+candidateName+
             "</td><td>"+office+
             "</td><td>"+contributorName+
             "</td><td>"+contributorAddr+
             "</td><td>"+contribAmount+' (Agg: '+contribAgg+')'
             "</td><td>"+electionPeriod+
             "</td></tr>"
      $("#search-result-body").append(row)

  searchWithCriteria = (groupingId, criteria) ->
    $.ajax(
      url: "/contribution_search/"+groupingId+".json",
      dataType: "json",
      type: "POST",
      data: {'criteria': JSON.stringify(criteria)},
      success: (data, textStatus, jqXHR) ->
        clearSearchResults()
        _.forEach(data, genSearchResultFn(JSON.stringify(criteria)))
        $('#grouping input.search-result-match').change(searchResultMatchChecked)
      ,
      error: (jqXHR, status, error) ->
        console.log "Failed to load data for search criteria: "+JSON.stringify(criteria)
      )

  genSearchCriteria = (searchType, searchToken) ->
    {type: searchType, v: searchToken}

  contribSearchClicked = (e) ->
    e.preventDefault()
    searchCriteria = $(this).closest('#grouping-contrib-search').find('div.form-group')
    allCriteria = []
    _.each searchCriteria, (s) ->
      searchType = $(s).find('.contrib-search-type').val()
      searchToken = $(s).find('.contrib-search-text').val()
      return if _.isEmpty(searchToken)

      allCriteria.push('and') if _.isEmpty(allCriteria)
      allCriteria.push genSearchCriteria(searchType, searchToken)

    return if _.isEmpty allCriteria
    groupingId = $('#grouping').data('grouping-id')
    searchWithCriteria groupingId, allCriteria

  $("#contrib-search-button").click contribSearchClicked
  $("#saved-matches button.remove-saved-match").click (e) ->
    e.preventDefault()
    row = $(this).closest('tr')
    removeSavedMatchRow(row)

  $(document).on 'click', ".search-attr-plus",  ->
    currRow = $(this).closest('div.form-group')
    currRow.clone().insertAfter(currRow)


$(loadGroupingPage)
$(document).on('page:load', loadGroupingPage) # for turbolinks
