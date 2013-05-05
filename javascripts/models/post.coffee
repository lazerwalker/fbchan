class app.Post extends Backbone.Model
  avatar: -> "https://graph.facebook.com/#{@uid()}/picture"
  uid: -> @get('from')?['id']
  message: -> @get('message') || ""
  name: -> @get('from')?['name']
  timestamp: -> @get('created_time')

  commentCount: -> @get('comments').count
  likeCount: -> @get('likes').count

  comments: ->
    return [] if @get('comments').count is 0

    comments = []
    for commentData in @get('comments').data
      console.log "Comment exists", commentData
      comments.push new app.Post(commentData)
    comments

  commentViews: ->
    views = []
    for comment in @comments()
      view = new app.views.Comment(model: comment)
      console.log "Creating view", comment, view
      views.push view.render().html()
    views