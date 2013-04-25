module ApplicationHelper
  def custom_value(name)
    object = RefinerySetting.find_by_name(name)
    object.value if object
  end
  
  def right_column
    (@page.images.empty? && @page.content_for(:side_body).blank?) ? false : true
  end
  
  def side_images
    images = @page.images
    images.inject(""){|tags,img| tags + image_tag(img.url)}.html_safe
  end
  
  def extra_content
    render :partial => "contact_page" if @page.title.eql?("Contact")
  end
  
  def mobile_device?
    request.user_agent =~ /Mobile|webOS/
  end
  
  def menu_link_title(menu_item)
    page = Page.find_by_title(menu_item.title)
    if page.link_text.present?
      page.link_text
    else
      menu_item.title
    end
  end
end
