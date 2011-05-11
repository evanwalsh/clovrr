module ApplicationHelper
  
  def flash_messages
    output = String.new
    flash.each do |type,message|
      output << content_tag(:div, message, :class => "flash \#{type}")
    end
    raw output
  end
  
end
