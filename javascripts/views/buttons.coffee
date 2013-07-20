class app.views.Buttons extends Backbone.View
  id: "buttons"

  render: ->
    for viewName in ['Toggle', 'Refresh']
      new app.views[viewName]().render().appendTo(@$el)

    @$el.appendTo("body")