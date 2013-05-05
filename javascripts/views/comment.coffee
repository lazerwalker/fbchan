app.registerTemplate('4chan', 'comment')

class app.views.Comment extends Backbone.View

  render: ->
    html = ich.comment(@model)
    @$el.html(html)

