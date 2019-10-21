module PostsHelper
  require 'redcarpet'
  require 'coderay'

  class HTMLwithCoderay < Redcarpet::Render::HTML
    def block_code(code, language)
      language = language.split(':')[0]

      case language.to_s
        when 'rb'
          lang = 'ruby'
        when 'yml'
          lang = 'yaml'
        when 'css'
          lang = 'css'
        when 'html'
          lang = 'html'
        when ''
          lang = 'md'
        else
          lang = language
      end

      CodeRay.scan(code, lang).div
    end
  end

   def markdown(text)
    html_render = HTMLwithCoderay.new( with_toc_data: true)

    option = {
        autolink: true,
        space_after_headers: true,
        fenced_code_blocks: true,
        tables: true,
        hard_wrap: true,
        lax_html_blocks: true,
        strikethrough: true
    }

    markdown = Redcarpet::Markdown.new(html_render, option)
    markdown.render(text)
  end
end
