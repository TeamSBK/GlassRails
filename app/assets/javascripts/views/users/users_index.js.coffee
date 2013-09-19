class GlassRails.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  el: '#container'

  events:
    'click .new'    : 'new'
    'click .create' : 'create'

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

  new: (e)->
    $('#user-form').slideDown()
    $('.update').hide()
    $('.create').show()


