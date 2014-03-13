# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = global ? window

loadGroupingPage = ->
  return unless $('#grouping').exists()

  # put "contribution/:contribution_id/search_token/:search_token" => 'contribution_search#match_add', as: :match_add
  # delete "contribution/:contribution_id/search_token/:search_token" => 'contribution_search#match_delete', as: :match_delete
  addMatch = (groupingId, contribId, searchToken) ->
    console.log 'ADD contribId: ' + contribId
    console.log 'searchToken: ' + searchToken
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
    console.log 'REM contribId: ' + contribId
    console.log 'searchToken: ' + searchToken
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

  searchResultMatchChecked = (e) ->
    isChecked = e.currentTarget.checked
    contributionId = $(e.currentTarget).data('contrib-id')
    searchToken = $(e.currentTarget).data('search-token')
    groupingId = $('#grouping').data('grouping-id')
    if isChecked
      console.log 'check: ' + contributionId
      addMatch(groupingId, contributionId, searchToken)
    else
      console.log 'uncheck: ' + + contributionId
      removeMatch(groupingId, contributionId, searchToken)
    console.log e


  clearSearchResults = ->
    $("#search-result-body").empty()

  genSearchResultFn = (searchToken) ->
    (searchResult) ->
      console.log searchResult
      candidateName   = searchResult['candidate_name']
      office           = searchResult['office']
      contributorName = searchResult['contributor_name']
      contributionId = searchResult['id']
      $("#search-result-body").append("<tr><td><input class='search-result-match' type='checkbox' data-contrib-id='"+contributionId+"' data-search-token='"+searchToken+"'>"+
                                      "</td><td>"+candidateName+
                                      "</td><td>"+office+
                                      "</td><td>"+contributorName+
                                      "</td></tr>");

  searchForToken = (searchToken) ->
    $.ajax(
      url: "/contribution_search/"+searchToken+".json",
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
    searchForToken searchToken

  $("#contrib-search-button").click contribSearchClicked

$(loadGroupingPage)
$(document).on('page:load', loadGroupingPage) # for turbolinks
