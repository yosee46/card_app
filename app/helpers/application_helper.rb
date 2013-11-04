# coding: utf-8
module ApplicationHelper
  def hbr(str)
    h(str).gsub(/(¥r¥n?)|(¥n)/, "<br />").html_safe
  end
end

