class app.views.Toggle extends Backbone.View
  id: "toggle"
  tagName: "button"

  events:
    click : "toggleTheme"

  toggleTheme: ->
    app.loadTheme(@otherTheme())

  otherTheme: ->
    if app.theme is "4chan"
      "Twitter"
    else
      "4chan"

  render: ->
    @$el.html("Switch to #{@otherTheme()}")
      .appendTo("body")