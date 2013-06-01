window.fbAsyncInit = ->
  handleLogin = (response) ->
    if response.status is 'connected'
      fetchList()
    else if response.status is 'not_authorized'
      FB.login()
    else
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
    window.list = list