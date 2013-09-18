window.GlassRails =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log('Backbone is already loaded')
    new GlassRails.Routers.Users()
    Backbone.history.start({pushState: true})

$(document).ready ->
  GlassRails.initialize()
