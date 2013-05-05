class app.PostList extends Backbone.Collection
  model: app.Post

  sync: (method, model, options) ->
    FB.api '/me/home', (data) ->
      options.success(data.data)