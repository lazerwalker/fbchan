class app.Post extends Backbone.Model
  sync: (method, model, options) ->
    FB.api @get('id'), (data) =>
      for key, value of data
        @set(key, value)

      options.success(data.data)

  like: ->
    unless @get('likes')
      @set('likes', {data:[]})

    @get('likes')['data'].push {id: app.me.id, name: app.me.name}
    @trigger('change')

    FB.api "/#{@get('id')}/likes", "post", {}, (response) =>
      if not response
        @get('likes')['data'].pop()
        @trigger('change')
