class app.views.PostList extends Backbone.View
  el: -> document.getElementById('content')

  render: =>
    @$el.html('')
    for model in @model.models
      $view = new app.views.Post[app.theme]({model}).render()
      $view.appendTo(@el) if $view?

