// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.User = (function(_super) {

    __extends(User, _super);

    function User() {
      return User.__super__.constructor.apply(this, arguments);
    }

    User.prototype.sync = function(method, model, options) {
      var _this = this;
      return FB.api('/me', function(data) {
        var key, value;
        for (key in data) {
          value = data[key];
          _this.set(key, value);
        }
        _this.name = _this.get('name');
        return options.success();
      });
    };

    return User;

  })(Backbone.Model);

}).call(this);
