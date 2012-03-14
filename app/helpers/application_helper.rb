module ApplicationHelper
  def insert_line_breaks text
    html_escape(text).gsub(/[\r\n]+/, "<br />").html_safe
  end
end
