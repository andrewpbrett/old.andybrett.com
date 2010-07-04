# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def truncate_with_dots(string, length)
    string[0..length] + "..."
  end

  def gmail_date_format(date)
    return "at " + date.localtime.strftime("%H") + ":" + date.localtime.strftime("%M") if date.localtime.day == Time.now.localtime.day && Time.now - date < 86400
    return "on " + date.localtime.day.to_s + " " + date.localtime.strftime("%B") if Time.now - date < 31536000
    return "on " + date.localtime.day.to_s + " " + date.localtime.month.to_s + " " + date.localtime.year.to_s
  end
end
