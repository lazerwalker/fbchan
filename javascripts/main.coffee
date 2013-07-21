window.app = {
  views: {}
}

networkCount = 0

registerTemplate = (service, name) ->
  $.ajax "templates/#{service.toLowerCase()}/#{name}.html",
    success: (data) ->
      ich.addTemplate(name, data)
    complete: -> checkIfFinishedLoading()

checkIfFinishedLoading = ->
  networkCount--
  if networkCount is 0
    app.list?.view.el = document.getElementById("content")
    app.router.refresh()

app.loadTheme = (service) ->
  return unless service in ['Twitter', '4chan', 'welcome']
  return if service is app.theme

  ich.clearAll()
  $fbRoot = $("#fb-root")
  app.theme = service

  networkCount++
  $.get "templates/#{service.toLowerCase()}/site.html", (data) =>
    ich.addTemplate 'site', data
    $("body").html(ich.site)

    # TODO: Can we just re-initialize FB or do something less horrendous?
    $("body").append($fbRoot)

    if service isnt 'welcome'
      new app.views.Buttons().render()

    app.showLoading()
    checkIfFinishedLoading()

  for view in ['post', 'comment', 'like', 'loading', 'inlineLoading', 'user']
    networkCount++
    registerTemplate(service, view)

app.showLoading = -> app.showStatic('loading')
app.showPartialLoading = -> $("#content").prepend(ich.inlineLoading())
app.showStatic = (name) ->
  $("#content").html(ich[name]?())

app.showIntro = ->
  app.loadTheme('welcome')

app.params = ->
  unless params
    setters = window.location.search[1..].split('&')
    params = {}
    for setter in setters
      [key, value] = setter.split('=')
      params[key] = value
  params


app.renderList = ->
  if app.list?
    app.list.view.render()
    app.showPartialLoading()
  else
    app.showLoading()
    app.list = new app.PostList
    app.list.view = new app.views.PostList({model:app.list})

  app.list.fetch
    success: ->
      app.list.view.render()

app.renderItem = (item) ->
  view = new app.views.Post[app.theme]
    model: item
    isDetailView: true
  view.render()

app.renderItemWithId = (id) ->
  app.showLoading()
  item = new app.Post(id: id)
  item.fetch
    success: -> app.renderItem(item)
