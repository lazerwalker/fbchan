class app.views.Post extends Backbone.View
  events: { 'click .permalink' : "clickPermalink" }

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
    content = @comments().concat @likes()
    if @isDetailView then content else content[0...3]

  likeable: ->
    like = _(@model.get('likes')?['data']).find( (obj) -> obj.id is app.me?.id )
    return not like?

  hiddenContent: ->
    @likes().length + @comments().length > 3

  hiddenCommentCount: ->
    commentCount = @comments().length || 0

    if commentCount is 0
      "0 comments"
    else if commentCount is 1
      "1 comment"
    else
      "#{commentCount} comments"

  hiddenLikeCount: ->
    commentCount = @comments().length
    likeCount = @likes().length || 0

    if likeCount is 0
      "0 likes"
    else if commentCount > 3
      "#{likeCount} likes"
    else if commentCount > 0
      "#{likeCount - (3 - commentCount)} likes"
    else
      "#{likeCount - 3} likes"

  initialize: (options) ->
    @$el.on 'click', '.like', =>
      @model.like()

    @model.on 'change', =>
      @render()

    for key, value of options
      @[key] = value

  render: ->
    return if !@message()

    html = ich.post(@)
    @$el.html(html)
    $('.dateTime').timeago()

    if @isDetailView
      $parent = $("#content")
      $parent.html('')
      @$el.appendTo($parent)

    return @$el

  clickPermalink: =>
    app.renderItem(@model)
    app.router.navigate("/post/#{@model.get('id')}")
    return false

