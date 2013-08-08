module ApplicationHelper
  # Returns the full title on a per-page basis

  # Live vs Construction
  # CONSTRUCTION = false
  CONSTRUCTION = true
  
  def full_title(page_title)
    base_title = "ArtGrabbr"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def admin?(current_url)
  	current_url.downcase.include?('payphone')
  end
end
