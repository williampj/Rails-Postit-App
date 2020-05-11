module ApplicationHelper
  def fix_url(str)
    str.start_with?('https//') ? str : "https://#{str}"
  end

  def date_time(dt)
    dt.strftime("%m/%d/%Y %l:%M%P %Z")
  end
end
