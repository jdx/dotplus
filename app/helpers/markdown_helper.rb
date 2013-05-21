module MarkdownHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, lax_spacing: true, autolink: true, space_after_headers: true)
    markdown.render(text).html_safe
  end
end
