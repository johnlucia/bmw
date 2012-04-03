module ApplicationHelper
  def custom_value(name)
    object = RefinerySetting.find_by_name(name)
    simple_format(object.value) if object
  end
end
