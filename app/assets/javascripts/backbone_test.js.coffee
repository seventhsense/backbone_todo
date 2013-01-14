window.BackboneTest =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new BackboneTest.Routers.Tasks
    Backbone.history.start()

$(document).ready ->
  BackboneTest.initialize()
