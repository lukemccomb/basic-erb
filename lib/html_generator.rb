require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(wrapper = nil)
    @layout = wrapper
  end

  def section(text)
    template = "<section><%= section_text %></section>"
    options_hash = {:locals => {:section_text => text}, :layout => @layout}
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
    options_hash = {:locals => {:items => list}, :layout => @layout}
    erb template, options_hash
  end

  def button(text, hsh = {})
    if hsh[:class] == nil
      template = "<button><%= button_text %></button>"
      options_hash = {:locals => {:button_text => text}, :layout => @layout}
      erb template, options_hash
    else
      template = "<button class='<%= hsh_class %>'><%= button_text %></button>"
      options_hash = {:locals => {:button_text => text, :hsh_class => hsh[:class] }, :layout => @layout}
      erb template, options_hash
    end
  end


end