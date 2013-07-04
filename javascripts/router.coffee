router = Backbone.Router.extend
  routes: {
    "" : "home"
    "post/:id"   : "post"
  }

  home: ->
    app.renderList()

  post: (post) ->
    app.renderItemWithId(post)

  refresh: ->
    currentRoute = Backbone.history.fragment
    @navigate('not a valid route')
    @navigate(currentRoute, {trigger: true})

window.app.router = new router()
