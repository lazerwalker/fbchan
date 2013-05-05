class app.Post extends Backbone.Model
  initialize: (options) ->
    @view = new app.views.Post(model: @)

