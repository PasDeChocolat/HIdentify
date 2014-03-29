# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = global ? window

loadGroupingPage = ->
  return unless $('#grouping').exists()

  # put "contribution/:contribution_id/search_token/:search_token" => 'contribution_search#match_add', as: :match_add
  # delete "contribution/:contribution_id/search_token/:search_token" => 'contribution_search#match_delete', as: :match_delete
  addMatch = (groupingId, contribId, searchToken) ->
    $.ajax(
      url: "/contribution/"+contribId+"/grouping/"+groupingId+"/search_token/"+searchToken+".json",
      dataType: "json",
      type: "PUT",
      success: (data, textStatus, jqXHR) ->
        console.log 'add match complete'
      ,
      error: (jqXHR, status, error) ->
        console.log "Failed to load data for search token: "+searchToken+ " contrib ID: "+contribId
      )

  removeMatch = (groupingId, contribId, searchToken) ->
    $.ajax(
      url: "/contribution/"+contribId+"/grouping/"+groupingId+"/search_token/"+searchToken+".json",
      dataType: "json",
      type: "DELETE",
      success: (data, textStatus, jqXHR) ->
        console.log 'remove match complete'
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
    isChecked = e.currentTarget.checked
    contributionId = $(e.currentTarget).data('contrib-id')
    searchToken = $(e.currentTarget).data('search-token')
    groupingId = $('#grouping').data('grouping-id')
    if isChecked
      addMatch(groupingId, contributionId, searchToken)
    else
      removeMatch(groupingId, contributionId, searchToken)


  clearSearchResults = ->
    $("#search-result-body").empty()

  genSearchResultFn = (searchToken) ->
    (searchResult) ->
      candidateName   = searchResult['candidate_name']
      office           = searchResult['office']
      contributorName = searchResult['contributor_name']
      contributorAddr = searchResult['formatted_full_address']
      electionPeriod = searchResult['election_period']
      contributionId = searchResult['id']
      matched = searchResult['is_matched']
      row = "<tr><td><input class='search-result-match' type='checkbox' data-contrib-id='"+contributionId+"' data-search-token='"+searchToken+"'"
      row += " CHECKED" if matched
      row += ">"+
             "</td><td>"+candidateName+
             "</td><td>"+office+
             "</td><td>"+contributorName+
             "</td><td>"+contributorAddr+
             "</td><td>"+electionPeriod+
             "</td></tr>"
      $("#search-result-body").append(row)

  searchForToken = (groupingId, searchToken) ->
    $.ajax(
      url: "/contribution_search/"+groupingId+"/"+searchToken+".json",
      dataType: "json",
      type: "GET",
      success: (data, textStatus, jqXHR) ->
        clearSearchResults()
        _.forEach(data, genSearchResultFn(searchToken))
        $('#grouping input.search-result-match').change(searchResultMatchChecked)
      ,
      error: (jqXHR, status, error) ->
        console.log "Failed to load data for search token: "+searchToken
      )

  contribSearchClicked = (e) ->
    e.preventDefault()
    searchToken = $("#contrib-search-text").val()
    return if _.isEmpty searchToken
    groupingId = $('#grouping').data('grouping-id')
    searchForToken groupingId, searchToken

  $("#contrib-search-button").click contribSearchClicked
  $("#saved-matches button.remove-saved-match").click (e) ->
    e.preventDefault()
    row = $(this).closest('tr')
    removeSavedMatchRow(row)

$(loadGroupingPage)
$(document).on('page:load', loadGroupingPage) # for turbolinks
