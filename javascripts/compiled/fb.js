// Generated by CoffeeScript 1.3.3
(function() {

  window.fbAsyncInit = function() {
    var handleLogin;
    handleLogin = function(response) {
      if (response.status === 'connected') {
        app.loadTheme('4chan');
        if (Modernizr.localstorage) {
          localStorage['loggedIn'] = true;
        }
        app.me = new app.User();
        app.me.view = new app.views.User({
          model: app.me
        });
        app.me.fetch({
          success: function() {
            return app.me.view.render();
          }
        });
        return Backbone.history.start();
      } else if (Modernizr.localstorage && localStorage["loggedIn"]) {
        app.loadTheme('4chan');
        return FB.login();
      } else {
        return app.showIntro();
      }
    };
    FB.init({
      appId: '213128445473721',
      status: true,
      xfbml: true
    });
    FB.Event.subscribe('auth.authResponseChange', handleLogin);
    FB.getLoginStatus(handleLogin);
    return $("body").on("click", "#login-button", (function() {
      return FB.login();
    }));
  };

}).call(this);
