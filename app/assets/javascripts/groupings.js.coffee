# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
root = global ? window

loadGroupingPage = ->
  return unless $('#grouping').exists()

  contribSearchClicked = (e) ->
    e.preventDefault()
    searchToken = $("#contrib-search-text").val()
    return if _.isEmpty searchToken
    console.log searchToken

  $("#contrib-search-button").click contribSearchClicked

$(loadGroupingPage)
$(document).on('page:load', loadGroupingPage) # for turbolinks
