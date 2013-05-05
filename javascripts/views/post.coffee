app.registerTemplate('4chan', 'post')
class app.views.Post extends Backbone.View

  render: ->
    html = ich.post(@model)
    @$el.html(html)

