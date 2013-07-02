$(document).on 'templatesLoaded', ->
  app.showLoading()

  window.fbAsyncInit = ->
    handleLogin = (response) ->
      if response.status is 'connected'
        if Modernizr.localstorage
          localStorage['loggedIn'] = true
        app.me = new app.User()
        app.me.view = new app.views.User(model: app.me)
        app.me.fetch
          success: ->
            app.me.view.render()

        Backbone.history.start()
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