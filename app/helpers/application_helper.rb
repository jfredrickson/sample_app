# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Return a title on a per-page basis.
  def title
    base_title = "Sample App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{h(@title)}"
    end
  end
  
  # Return a logo with a link to the Home page.
  def logo
    logo = image_tag("logo.png", :alt => "Sample App", :class => "round")
    link_to logo, root_path
  end
  
end
