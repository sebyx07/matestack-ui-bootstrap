class Dummy::Components::Md < Matestack::Ui::StaticComponent

  requires :path
  optional :lang

  def response
    div class: "markdown-content bg-white", attributes: { "v-pre": true } do
      plain parsed_markdown.html_safe
    end
  end

  def parsed_markdown
    _file = File.read("#{::Rails.root}/#{path}")
    begin
      if lang.present?
        _file.prepend("```#{lang} \n")
        _file.concat("\n ```")
      end
    rescue => e
      raise e
    end

    renderer = RougeRender.new(with_toc_data: true)
    parser = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
    parser.render(_file.encode('utf-8', invalid: :replace, undef: :replace, replace: '_'))
  end

end
