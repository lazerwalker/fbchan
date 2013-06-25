class app.Post extends Backbone.Model
  like: ->
    FB.api "/#{@get('id')}/likes", "post", {}, (response) ->
      console.log response