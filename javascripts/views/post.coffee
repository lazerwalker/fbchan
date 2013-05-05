class app.views.Post extends Backbone.View
  initialize: ->
    unless ich.post?
      $.get 'templates/4chan/post.html', (data) ->
        ich.addTemplate('post', data)

  render: ->
    html = ich.post(@model)
    @$el.html(html)

