class app.User extends Backbone.Model
  initialize: (opts) ->
    @sync()

  sync: ->
    FB.api '/me', (data) =>
      @set(key, value) for key, value of data
      @name = @get('name')