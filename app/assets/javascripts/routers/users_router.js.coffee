class GlassRails.Routers.Users extends Backbone.Router

  routes:
    '':    'index'

  index: ->
    new GlassRails.Views.UsersIndex()
