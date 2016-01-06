module ApplicationHelper
  def markdown(text)
    return '' unless text

    RDiscount.new(text).to_html.html_safe
  end
end
