// Generated by CoffeeScript 1.3.3
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  app.views.PostList = (function(_super) {

    __extends(PostList, _super);

    function PostList() {
      this.render = __bind(this.render, this);
      return PostList.__super__.constructor.apply(this, arguments);
    }

    PostList.prototype.el = function() {
      return document.getElementById('content');
    };

    PostList.prototype.render = function() {
      var $view, model, _i, _len, _ref, _results;
      this.$el = $(this.el);
      this.$el.html('');
      _ref = this.model.models;
      _results = [];
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        model = _ref[_i];
        $view = new app.views.Post[app.theme]({
          model: model
        }).render();
        if ($view != null) {
          _results.push($view.appendTo(this.el));
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    };

    return PostList;

  })(Backbone.View);

}).call(this);
