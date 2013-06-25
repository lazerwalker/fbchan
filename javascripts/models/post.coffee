class app.Post extends Backbone.Model
  like: ->
    unless @get('likes')
      @set('likes', {data:[]})

    @get('likes')['data'].push {id: app.me.id, name: app.me.name}
    @trigger('change')

    FB.api "/#{@get('id')}/likes", "post", {}, (response) =>
      if not response
        @get('likes')['data'].pop()
        @trigger('change')
