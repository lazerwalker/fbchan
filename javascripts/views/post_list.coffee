class app.views.PostList extends Backbone.View
  el: -> document.getElementById('content')

  render: =>
    @$el.html('')
    for view in _(@model.models).pluck('view')
      view.render().appendTo(@el)

