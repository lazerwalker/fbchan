// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.views.Refresh = (function(_super) {

    __extends(Refresh, _super);

    function Refresh() {
      return Refresh.__super__.constructor.apply(this, arguments);
    }

    Refresh.prototype.id = "refresh";

    Refresh.prototype.tagName = "button";

    Refresh.prototype.events = {
      click: "refresh"
    };

    Refresh.prototype.refresh = function() {
      return app.router.refresh();
    };

    Refresh.prototype.render = function() {
      return this.$el.html("Refresh");
    };

    return Refresh;

  })(Backbone.View);

}).call(this);