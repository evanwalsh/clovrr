module ApplicationHelper
  
  def flash_messages
    output = String.new
    flash.each do |type,message|
      output << content_tag(:div, message, :class => "flash \#{type}")
    end
    raw output
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def monthname(monthnumber)  
    if monthnumber  
      Date::MONTHNAMES[monthnumber.to_i]  
    end  
  end
  
end
