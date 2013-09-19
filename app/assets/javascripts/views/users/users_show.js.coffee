class GlassRails.Views.UsersShow extends Backbone.View

  template: JST['users/show']

  tagName: 'tr'

  events:
    'click .edit'   : 'edit'
    'click .update' : 'update'
    'click .delete' : 'delete'

  initialize: (options) ->
    @el = options.el

  render: ->
    $(@el).html(@template({model: @model}))
    @

  edit: (e)->
    $("#user-form input[name='email']").val(@model.email)
    $("#user-form input[name='last_name']").val(@model.last_name)
    $("#user-form input[name='first_name']").val(@model.first_name)

    $('#user-form').slideDown()
    $('.create').hide()
    $('.update').show()


  update: (e)->
    e.preventDefault()
    $('#user-form').slideUp()

  delete: (e)->
    glass.User.destroy {id: @model.id}, (res, err) ->
      alert('User has been deleted') unless err

