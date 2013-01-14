class BackboneTest.Routers.Tasks extends Backbone.Router
  routes:
    '': 'index'

  initialize: ->
    @collection = new BackboneTest.Collections.Tasks()
    @collection.fetch()

  index: ->
    view = new BackboneTest.Views.TasksIndex(collection: @collection)
    $('body').html(view.render().el)
