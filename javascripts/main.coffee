window.app = {
  views: {}
}

networkCount = 0

registerTemplate = (service, name) ->
  $.get "templates/#{service}/#{name}.html", (data) ->
    ich.addTemplate(name, data)
    checkIfFinishedLoading()

checkIfFinishedLoading = ->
  networkCount--
  if networkCount is 0
    $(document).trigger('templatesLoaded')

app.showLoading = -> app.showStatic('loading')
app.showPartialLoading = -> $("#content").prepend(ich.inlineLoading())
app.showIntro = -> app.showStatic('intro')

app.showStatic = (name) ->
  $("#content").html(ich[name]?())

app.params = ->
  unless params
    setters = window.location.search[1..].split('&')
    params = {}
    for setter in setters
      [key, value] = setter.split('=')
      params[key] = value
  params


app.loadTheme = (service) ->
  for view in ['post', 'comment', 'like', 'loading', 'intro', 'inlineLoading']
    networkCount++
    registerTemplate(service, view)

  networkCount++
  $.get "templates/#{service}/site.html", (data) =>
    ich.addTemplate 'site', data
    $("body").html(ich.site)
    checkIfFinishedLoading()

    $.get "templates/#{service}/stylesheets.html", (data) =>
      $('head').append(data)

app.loadTheme('4chan')

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
  view = new app.views.Post
    model: item
    isDetailView: true
  view.render()

app.renderItemWithId = (id) ->
  app.showLoading()
  item = new app.Post(id: id)
  item.fetch
    success: -> app.renderItem(item)
