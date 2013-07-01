class app.PostList extends Backbone.Collection
  model: app.Post

  comparator: (post) ->
    post.get('created_time')

  sync: (method, model, options) ->
    FB.api '/me/home', (data) ->
      console.log data
      options.success(data.data)