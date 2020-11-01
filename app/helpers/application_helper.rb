module ApplicationHelper
  WEBSITE_NAME = 'Bucket Posts'

  def full_title(page_title = '')
    base_title = WEBSITE_NAME
    if page_title.empty?
      base_title
    else
      page_title + '|' + base_title
    end
  end
  # デバイスのエラーメッセージ出力メソッド(新規登録)
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <p class="error_msg">#{msg}</p>
        </div>
      EOF
    end
    html.html_safe
  end
end

def header_link_item(name, path)
  class_name = 'navber-item'
  class_name << ' active' if current_page?(path)

  content_tag :li, class: class_name do
    link_to name, path, class: 'navber-link'
  end
end
