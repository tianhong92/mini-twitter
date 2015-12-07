module PostsHelper
  def format_date(date)
    date.strftime('%A %B %C at %H:%M')
  end
end
