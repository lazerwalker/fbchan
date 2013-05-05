window.fbAsyncInit = ->
    FB.init(
      appId      : '213128445473721'
      # channelUrl : '//channel.html',
      status     : true
      xfbml      : true
    )

    FB.Event.subscribe 'auth.authResponseChange', (response) ->
      if response.status is 'connected'
        list = new app.PostList
        list.fetch
          success: list.view.render

      else if response.status is 'not_authorized'
        FB.login()

    FB.login()

