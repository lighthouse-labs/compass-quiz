module ApplicationHelper
  def markdown(text)
    return '' unless text

    RDiscount.new(text).to_html.html_safe
  end

  def active_class(path)
    current_page?(path) ? 'active' : ''
  end
end
