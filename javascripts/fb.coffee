$(document).on 'templatesLoaded', ->
  window.fbAsyncInit = ->
    handleLogin = (response) ->
      if response.status is 'connected'
        app.showLoading()
        fetchList()
        app.me = new app.User()
      else if Modernizr.localstorage and localStorage["loggedIn"]
        app.showLoading()
        FB.login()
      else
        app.showIntro()

    FB.init(
      appId      : '213128445473721'
      # channelUrl : '//channel.html',
      status     : true
      xfbml      : true
    )

    FB.Event.subscribe('auth.authResponseChange', handleLogin)
    FB.getLoginStatus(handleLogin)

    $("body").on("click", "#intro .login", (-> FB.login()))

    fetchList = ->
      if Modernizr.localstorage
        localStorage['loggedIn'] = true

      list = new app.PostList
      list.fetch
        success: ->
          view = new app.views.PostList({model:list})
          view.render()
