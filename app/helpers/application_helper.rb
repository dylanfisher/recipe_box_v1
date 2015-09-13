module ApplicationHelper

  def body_class(content='')
    classes = "admin-area " if controller_path.split('/').first == 'admin'
    classes += "controller--#{controller_path.gsub('/', '-')} " if try(:controller_path)
    classes += "action--#{action_name} " if try(:action_name)
    classes += "#{content} " if content.present?
    "class='#{classes}'".html_safe
  end

  def record
    instance_variable_get("@#{controller_name.singularize}")
  end

  def record_title
    if record.respond_to?(:title)
      record.title
    elsif record.respond_to?(:name)
      record.name
    elsif record
      "#{controller_name.singularize.titleize} #{record.id}"
    end
  end

  def page_title(&block)
    site_title = Rails.application.class.parent_name
    record = params[:controller].titleize
    if content_for? :title
      content_for :title
    elsif record_title
      record = record_title
    end
    [record, site_title].join(' - ')
  end

  def md(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return markdown.render(text).html_safe
  end

  def cache_key_for(model)
    count          = model.count
    max_updated_at = model.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{model.model_name.plural}/all-#{count}-#{max_updated_at}"
  end

  def embedded_svg(filename, options={})
    file = File.read(Rails.root.join('app', 'assets', 'images', 'svg', filename))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end

  def show_header_info?
    return true if action_name != 'show'
  end

end
