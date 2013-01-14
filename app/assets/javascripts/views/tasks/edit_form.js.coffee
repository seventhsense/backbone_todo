class BackboneTest.Views.EditForm extends Backbone.View

  template: JST['tasks/edit_form']
  tagName: 'li'

  events:
    'blur input:text': 'updateContent'

  render: ->
    $(@el).html(@template(value: @model))
    this

  updateContent: ->
    value = event.target.value
    unless value is ''
      @model.set(content: value)
      @model.save()
