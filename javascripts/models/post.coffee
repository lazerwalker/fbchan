class app.Post extends Backbone.Model
  avatar: -> "https://graph.facebook.com/#{@uid()}/picture"
  uid: -> @get('from')?['id']
  message: -> @get('message') || ""
  name: -> @get('from')?['name']
  timestamp: -> @get('created_time')
