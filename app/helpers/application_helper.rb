module ApplicationHelper
  def background_class
    if @page.try(:type) == "Homepage"
      "background"
    else
      "background-gradient-down-right"
    end
  end
end
