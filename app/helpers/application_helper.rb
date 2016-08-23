module ApplicationHelper

  def full_title(page_title = nil)
    [page_title, "My task"].compact.join(" | ")
  end

end
