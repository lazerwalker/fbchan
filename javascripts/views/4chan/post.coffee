class app.views.Post['4chan'] extends app.views.Post
  commentsAndLikes: ->
    content = super
    if @isDetailView then content else content[0...3]

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

  beforeRender: ->
    if @isDetailView
      $parent = $("#content")
      $parent.html('')
      @$el.appendTo($parent)
