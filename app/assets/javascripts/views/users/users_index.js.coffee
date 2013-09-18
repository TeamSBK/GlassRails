class GlassRails.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  initialize: ->
    @render()


  render: ->
    $("#container").html(@template)

    glass.User.findAll (res, err) ->
      @collection = res unless err

      current_view = @
      _.map @collection, (user) ->
        view = new GlassRails.Views.UsersShow(model: user)

      @
