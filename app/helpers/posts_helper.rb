module PostsHelper
  def getDate
      postDate= @post.created_at.strftime('%A %B %C at %H:%M')
      return postDate
  end

  def getDate2(post)
    postDate= post.created_at.strftime('%A %B %C at %H:%M')
    return postDate
  end
end
