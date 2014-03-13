# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = global ? window

loadGroupingPage = ->
  return unless $('#grouping').exists()

  addSearchResult = (searchResult) ->
    console.log searchResult
    candidateName   = searchResult['candidate_name']
    office           = searchResult['office']
    contributorName = searchResult['contributor_name']
    $("#search-result-body").append("<tr><td>"+candidateName+"</td><td>"+office+"</td><td>"+contributorName+"</td></tr>");

  searchForToken = (searchToken) ->
    $.ajax(
      url: "/contribution_search/"+searchToken+".json",
      dataType: "json",
      type: "GET",
      success: (data, textStatus, jqXHR) ->
        _.forEach(data, addSearchResult)
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
