$(document).on 'templatesLoaded', ->
  window.fbAsyncInit = ->
    handleLogin = (response) ->
      if response.status is 'connected'
        if Modernizr.localstorage
          localStorage['loggedIn'] = true
        app.showLoading()
        fetch()
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

    console.log "Async init"
    FB.Event.subscribe('auth.authResponseChange', handleLogin)
    FB.getLoginStatus(handleLogin)

    $("body").on("click", "#intro .login", (-> FB.login()))

    fetch = ->
      if app.params()["postId"]?
        item = new app.Post(id: app.params().postId)
        item.fetch
          success: ->
            view = new app.views.Post
              model: item
              isDetailView: true
            view.render()
      else
        list = new app.PostList
        list.fetch
          success: ->
            view = new app.views.PostList({model:list})
            view.render()
