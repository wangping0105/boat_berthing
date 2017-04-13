module ApplicationHelper
  # 字符串取前length 长度的值
  def deal_string(str, length)
    str.length > length ? "#{str[0...length]}...": str
  end

  def active_by(name)
    if name.class == String
      controller_name == name ? "active" : ''
    else
      controller_name.in?(name) ? "active" : ''
    end
  end
end
