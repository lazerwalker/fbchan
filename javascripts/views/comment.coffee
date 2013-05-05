class app.views.Comment extends app.views.Post

  render: ->
    html = ich.comment(@)
    @$el.html(html)

