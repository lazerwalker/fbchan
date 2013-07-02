class app.User extends Backbone.Model
  sync: (method, model, options) ->
    FB.api '/me', (data) =>
      @set(key, value) for key, value of data
      @name = @get('name')

      options.success()