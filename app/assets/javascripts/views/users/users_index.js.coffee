class GlassRails.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  initialize: ->
    @render()


  render: ->
    $("#container").html(@template)

    glass.User.findAll (res, err) ->
      @collection = res unless err

      _.map @collection, (user) ->
        view = new GlassRails.Views.UsersShow(model: user)
        view.render()

      @
