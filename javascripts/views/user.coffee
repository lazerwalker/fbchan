class app.views.User extends Backbone.View
  el: -> document.getElementById('user')

  render: ->
    if ich.user?
      html = ich.user(@)
      @$el.html(html)

  # Presentation details
  name: -> @model.get('name')
  avatar: -> "https://graph.facebook.com/#{@model.get('id')}/picture"
