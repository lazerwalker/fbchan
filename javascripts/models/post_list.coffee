class app.PostList extends Backbone.Collection
  model: app.Post

  initialize: (options) ->
    @view = new app.views.PostList(model: @)

  sync: (method, model, options) ->
    FB.api '/me/home', (data) ->
      options.success(data.data)