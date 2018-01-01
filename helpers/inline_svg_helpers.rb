module InlineSvgHelpers
  def inline_svg(filename, options = {})
    root = Middleman::Application.root
    images_path = config[:images_dir]
    file_path = "#{root}/source/#{images_path}/#{filename}"

    if File.exists?(file_path)
      file = File.open(file_path, 'r') { |f| f.read }
      doc = Oga.parse_xml(file)

      svg = doc.css('svg').first

      if options[:class].present?
        svg.set(:class, options[:class])
      end

      doc.to_xml
    else
      "<!-- SVG file not found: #{not_found_message(filename)} -->".html_safe
    end
  end

  private

  def not_found_message(filename)
    "'#{filename}' #{extension_hint(filename)}"
  end

  def extension_hint(filename)
    filename.end_with?(".svg") ? "" : "(Try adding .svg to your filename)"
  end
end
