module ApplicationHelper
  def custom_value(name)
    object = RefinerySetting.find_by_name(name)
    simple_format(object.value) if object
  end
  
  def right_column
    (@page.images.empty? && @page.content_for(:side_body).blank?) ? false : true
  end
  
  def side_images
    images = @page.images
    images.inject(""){|tags,img| tags + image_tag(img.url)}.html_safe
  end
end
