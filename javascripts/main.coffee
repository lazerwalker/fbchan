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
app.showIntro = -> app.showStatic('intro')

app.showStatic = (name) ->
  $("#content").html(ich[name]?())

app.loadTheme = (service) ->
  for view in ['post', 'comment', 'like', 'loading', 'intro']
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
