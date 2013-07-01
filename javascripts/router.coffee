router = Backbone.Router.extend
  routes: {
    "" : "home"
    "post/:id"   : "post"
  }

  home: ->
    app.renderList()

  post: (post) ->
    app.renderItemWithId(post)

window.app.router = new router()
