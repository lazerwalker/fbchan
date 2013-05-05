app.registerTemplate('4chan', 'post')

class app.views.Post extends Backbone.View
  avatar: -> "https://graph.facebook.com/#{@uid()}/picture"
  uid: -> @model.get('from')?['id']
  message: -> @model.get('message') || ""
  name: -> @model.get('from')?['name']
  timestamp: -> @model.get('created_time')

  commentCount: -> @model.get('comments').count
  likeCount: -> @model.get('likes').count

  comments: ->
    return [] if @model.get('comments').count is 0

    comments = []
    for commentData in @model.get('comments').data
      comment = new app.Post(commentData)
      view = new app.views.Comment(model: comment)
      comments.push view.render().html()
    comments

  render: ->
    html = ich.post(@)
    @$el.html(html)

