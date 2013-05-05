class app.views.Like extends app.views.Post
  name: -> @model.get('name')
  uid: -> @model.get('id')

  render: ->
    html = ich.like(@)
    @$el.html(html)

