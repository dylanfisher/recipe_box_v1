module ApplicationHelper

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

end
