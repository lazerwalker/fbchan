class app.views.Post extends Backbone.View
  sharedEvents: { 'click .permalink' : "clickPermalink" }
  events: -> @sharedEvents

  avatar: -> "https://graph.facebook.com/#{@uid()}/picture"
  id: -> @model.get('id')
  uid: -> @model.get('from')?['id']
  message: -> @model.get('message')
  name: -> @model.get('from')?.name
  recipient: -> @model.get('to')?.data[0].name
  timestamp: -> @model.get('created_time')
  picture: ->
    pic = @model.get('picture')
    if pic?
      pic.replace(/_[a-z]\.jpg$/, '_n.jpg')

  commentLink: -> @model.get('actions')[0].link

  link: ->
    if @model.get('link')
      return {
        link: @model.get('link')
        linkName: @model.get('name')
        description: @model.get('description')
      }

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

  commentsAndLikes: ->
    @comments().concat @likes()

  likeable: ->
    like = _(@model.get('likes')?['data']).find( (obj) -> obj.id is app.me?.id )
    return not like?

  initialize: (options) ->
    @$el.on 'click', '.like', =>
      @model.like()

    @model.on 'change', =>
      @render()

    for key, value of options
      @[key] = value

  beforeRender: ->
    # Implement this in your subclass for specific render behavior

  render: ->
    return if !@message()
    @beforeRender()

    html = ich.post(@)
    @$el.html(html)

    $('.dateTime').timeago()

    return @$el

  clickPermalink: =>
    app.renderItem(@model)
    app.router.navigate("/post/#{@model.get('id')}")
    return false

