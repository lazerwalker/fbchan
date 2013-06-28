$(document).on 'templatesLoaded', ->
  app.showLoading()

  window.fbAsyncInit = ->
    handleLogin = (response) ->
      if response.status is 'connected'
        fetchList()
        app.me = new app.User()
      else
        # TODO: show landing page with 'login' button
        FB.login()

    FB.init(
      appId      : '213128445473721'
      # channelUrl : '//channel.html',
      status     : true
      xfbml      : true
    )

    FB.Event.subscribe('auth.authResponseChange', handleLogin)
    FB.getLoginStatus(handleLogin)

    fetchList = ->
      list = new app.PostList
      list.fetch
        success: ->
          view = new app.views.PostList({model:list})
          view.render()

          if Modernizr.localstorage
            localStorage['list'] = JSON.stringify(list)
