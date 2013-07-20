class app.views.Refresh extends Backbone.View
  id: "refresh"
  tagName: "button"

  events:
    click : "refresh"

  refresh: ->
    app.router.refresh()

  render: ->
    @$el.html("Refresh")
