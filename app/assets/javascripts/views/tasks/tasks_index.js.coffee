class BackboneTest.Views.TasksIndex extends Backbone.View

  template: JST['tasks/index']

  events:
    'submit #new_task': 'addTask'

  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendTasks, this)

  render: ->
    $(@el).html(@template())
    @collection.each(@appendTasks)
    this

  addTask: (event) ->
    event.preventDefault()
    @collection.create content: $('#new_task_content').val()
    $('#new_task')[0].reset()

  appendTasks: (task) ->
    view = new BackboneTest.Views.Task(model: task)
    $('#tasks').append(view.render().el)
