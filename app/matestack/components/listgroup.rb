class Components::Listgroup < Matestack::Ui::StaticComponent

  optional :items, :item_class, :horizonal, :h_size, :flush, :tablist, class: { as: :bs_class }

  def response 
    ul lg_attributes do
      yield_components if !items.present?
      list_partial if items.present?
    end
  end

  protected

  def list_partial
    items.each do |key, item|
      case item[:type]        
      when :link 
        link link_attrs item[:id], item[:color], item[:path]  do
          plain item[:content]
        end
      when :button 
        button id: item[:id], class: "#{list_classes item[:color], true}", attributes: { 'type': "button" } do
          plain item[:content]
        end
      when :label 
        label id: item[:id], class: "#{list_classes item[:color], false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "" } if checkbox
          plain item[:content]
        end
      else
        li id: item[:id], class: "#{list_classes item[:color], false}" do
          input class: "form-check-input mr-1", attributes: { 'type': "checkbox", 'value': "", 'aria-label': "#{item[:content]}" } if checkbox
          plain item[:content]
        end
      end
    end
  end

  def lg_attributes
    html_attributes.merge(
      class: lg_classes,
      attributes: { 'role': "tablist" } if tablist
    )
  end

  def lg_classes
    [].tap do |classes|
      classes << 'list-group'
      classes << (h_size.present? ? "list-group-horizontal-#{h_size}": "list-group-horizontal") if horizonal
      classes << 'list-group-flush' if flush
      classes << bs_class
    end.join(' ').strip
  end

  def link_attrs l_id, color, path
    {
      id: l_id,
      class: "#{list_classes color, true}",
      data: { toggle: "list" } if tablist, 
      attributes: { 'aria-controls': "#{id}", 'role': "tab" } if tablist,
      path: path
    }
  end

  def list_classes color, action
    [].tap do |classes|
      classes << 'list-group-item'
      classes << 'list-group-item-action' if action
      classes << "list-group-item-#{color}"
      classes << item_class
    end.join(' ').strip
  end
end