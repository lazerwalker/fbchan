class app.views.Post extends Backbone.View
  avatar: -> "https://graph.facebook.com/#{@uid()}/picture"
  uid: -> @model.get('from')?['id']
  message: -> @model.get('message')
  name: -> @model.get('from')?.name
  recipient: -> @model.get('to')?.data[0].name
  timestamp: -> @model.get('created_time')
  picture: ->
    pic = @model.get('picture')
    if pic?
      pic.replace(/_[a-z]\.jpg$/, '_n.jpg')

  commentCount: -> @model.get('comments').count
  likeCount: -> @model.get('likes').count

  comments: ->
    commentObj = @model.get('comments')
    unless commentObj.count > 0 and commentObj?.data
      return []

    comments = []
    for commentData in commentObj.data
      comment = new app.Post(commentData)
      view = new app.views.Comment(model: comment)
      comments.push view.render().html()
    comments

  likes: ->
    return [] unless @model.get('likes')?

    likes = []
    for likeData in @model.get('likes').data
      like = new app.Post(likeData)
      view = new app.views.Like(model: like)
      likes.push view.render().html()
    likes

  render: ->
    return if !@message()

    html = ich.post(@)
    @$el.html(html)

