class app.views.Post.Twitter extends app.views.Post
  mentionName: -> "@" + @recipient()?.replace(" ", "")
  twittifiedName: -> "@" + @name()?.replace(" ", "")