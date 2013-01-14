class BackboneTest.Views.Task extends Backbone.View
  template: JST['tasks/task']
  tagName: 'li'

  events:
    'change input:checkbox': 'changeDone'
    'dblclick span.task_content': 'editTask'
    'blur input#edit_task_content': 'render'

  render: ->
    $(@el).html(@template(task: @model))
    this

  changeDone: (event) ->
    id = '#' + event.target.id
    if $(id).attr('checked')
      @model.set('done': true)
    else
      @model.set('done': false)
    @model.save()
    @render()

  editTask: (event) ->
    view = new BackboneTest.Views.EditForm(model: @model)
    console.log $('#' + event.target.id)
    $('#' + event.target.id).parent().html(view.render().el)
      .find('input').focus()

  destroyTask: (event) ->
    if confirm '削除していいですか？'
      @model.destroy()

