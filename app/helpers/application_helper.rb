# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def form_field(f, type, name, label)
    "<li>
      <label for='#{name}'>#{label}</label>
      #{f.send(type, name)}
    </li>"
  end
end
