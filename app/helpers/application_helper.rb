module ApplicationHelper

  def markdown(text)
    return '' unless text

    RDiscount.new(text).to_html.html_safe
  end

  def active_class(path)
    current_page?(path) ? 'active' : ''
  end

  def in_n_pages(relation, number_of_pages)
    page_size = (relation.count / number_of_pages.to_f).ceil
    number_of_pages.times { |page| yield relation.limit(page_size).offset(page_size * page) }
  end

end
