$.get 'templates/4chan/post.html', (data) ->
  ich.addTemplate('post', data)

class app.views.Post extends Backbone.View

  render: ->
    html = ich.post(@model)
    @$el.html(html)

