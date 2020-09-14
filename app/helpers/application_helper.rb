module ApplicationHelper
  WEBSITE_NAME = 'エントレ！'

  def full_title(page_title = '')
    base_title = WEBSITE_NAME
    if page_title.empty?
      base_title
    else
      page_title + '|' + base_title
    end
  end
end
