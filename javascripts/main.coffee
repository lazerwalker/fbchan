window.app = {
  views: {}
}

registerTemplate = (service, name) ->
  $.get "templates/#{service}/#{name}.html", (data) ->
    ich.addTemplate(name, data)

app.loadTheme = (service) ->
  for view in ['post', 'comment', 'like']
    registerTemplate(service, view)

app.loadTheme('4chan')

$.get 'templates/4chan/site.html?callback=', (data) =>
  ich.addTemplate 'site', data
  bootstrap()

  $.get 'templates/4chan/stylesheets.html?callback=', (data) =>
    $('head').append(data)

bootstrap = ->
  $("body").html(ich.site)