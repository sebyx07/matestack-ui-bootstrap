class Matestack::Ui::Bootstrap::Components::Tooltip < Matestack::Ui::VueJsComponent
  vue_name "matestack-ui-bootstrap-tooltip"

  DATA_ALIAS_ATTRIBUTES = %i[container delay selector html template fallback_placement]

  DATA_ALIAS_ATTRIBUTES.each do |attribute|
    optional :"#{attribute}"
  end

  # TODO:
  # for security reasons the sanitize, sanitizeFn and whiteList options cannot be supplied using data attributes.
  # sanitize sanitize_fn white_list
  # optional :content
  required :tooltip_title
  optional :tag
  optional :class
  optional :id
  DATA_ATTRIBUTES = %i[text variant animation placement tabindex trigger boundary offset popper_config]
  optional *DATA_ATTRIBUTES

  def response
    case context.tag
    when :div
      div tooltip_attributes do
        yield
      end
    else
      span tooltip_attributes do
        yield
      end
    end
  end

  protected

  def tooltip_attributes
    attributes = {}.tap do |hash|
      hash[:class] = tooltip_classes
      hash[:text] = context.text if context.text.present?
      hash[:data] = {}.tap do |hash|
        DATA_ALIAS_ATTRIBUTES.each do |attribute|
          hash["bs-#{attribute}"] = self.send("context.#{attribute}") if self.send("context.#{attribute}")
        end
        DATA_ATTRIBUTES.each do |attribute|
          hash["bs-#{attribute}"] = self.send("context.#{attribute}") if self.send("context.#{attribute}")
        end
        hash["bs-toggle"] = "tooltip"
        hash["bs-type"] = context.tag
        hash["bs-placement"] = "auto" if context.placement.nil?
        hash["bs-title"] = context.tooltip_title
      end
    end
    options.merge(
      attributes
    )
  end

  def tooltip_classes
    [].tap do |classes|
      classes << context.class
    end.join(' ').strip
  end

end
