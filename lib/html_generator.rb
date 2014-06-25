require "erb_generator"

class HTMLGenerator < ERBGenerator
  def section(text)
    template = "<section><%= section_text %></section>"
    options_hash = {:locals => {:section_text => text}}
    erb template, options_hash
  end

  def unordered_list(list)
    template = <<-TEMPLATE
      <ul>
        <% items.each do |item| %>
          <li><%= item %></li>
        <% end %>
      </ul>
    TEMPLATE
    options_hash = {:locals => {:items => list}}
    erb template, options_hash
  end

  def button(text)
    template = "<button><%= button_text %></button>"
    options_hash = {:locals => {:button_text => text}}
    erb template, options_hash
  end
end