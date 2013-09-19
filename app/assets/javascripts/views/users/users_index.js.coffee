class GlassRails.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  el: '#container'

  events:
    'click .new'    : 'new'
    'click .create' : 'create'
    'click .update' : 'update'

  initialize: ->
    @render()

  render: ->
    $(@el).html(@template)

    glass.User.findAll (res, err) ->
      @collection = res unless err

      _.map @collection, (user) ->
        $("#users").append("<tr></tr>")
        view = new GlassRails.Views.UsersShow(model: user, el: $('tr').last())
        view.render()

      @

  create: (e)->
    e.preventDefault()
    $('#user-form').slideUp()

    object = $('#user-form').serializeObject()

    glass.User.create object, (res, err) =>
      unless err
        user = res
        $("#users").append("<tr></tr>")
        view = new GlassRails.Views.UsersShow(model: user, el: $('tr').last())
        view.render()

  update: (e)->
    e.preventDefault()
    $('#user-form').slideUp()

    object = $('#user-form').serializeObject()
    console.log(object)

    glass.User.update object, (res, err) =>
      @render() unless err

  new: (e)->
    $('#user-form').slideDown()
    $('.update').hide()
    $('.create').show()

    $("#user-form input[name='email']").val('')
    $("#user-form input[name='last_name']").val('')
    $("#user-form input[name='first_name']").val('')
    $("#user-form input[name='id']").val('')

