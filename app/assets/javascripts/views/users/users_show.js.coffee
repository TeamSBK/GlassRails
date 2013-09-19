class GlassRails.Views.UsersShow extends Backbone.View

  template: JST['users/show']

  tagName: 'tr'

  el: '#users'

  initialize: ->

  render: ->
    $(@el).append(@template({model: @model}))
    @

