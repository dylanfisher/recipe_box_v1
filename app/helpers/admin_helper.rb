module AdminHelper

  def admin_record_name(record)
    record.name.gsub(/^admin_?/, '').titleize
  end

end
