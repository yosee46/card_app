# coding: utf-8
module ApplicationHelper
  def hbr(str)
    h(str).gsub(/(¥r¥n?)|(¥n)/, "<br />").html_safe
  end

  def apply_img_and_hbr (str)
    str_br = h(str).gsub(/(¥r¥n?)|(¥n)/, "<br />")
    apply_mana_img(str_br).html_safe
  end

  def apply_mana_img (str)
    str.gsub('{1}', mana_img("1"))
       .gsub('{2}', mana_img("2"))
       .gsub('{3}', mana_img("3"))
       .gsub('{4}', mana_img("4"))
       .gsub('{5}', mana_img("5"))
       .gsub('{6}', mana_img("6"))
       .gsub('{7}', mana_img("7"))
       .gsub('{8}', mana_img("8"))
       .gsub('{9}', mana_img("9"))
       .gsub('{10}', mana_img("10"))
       .gsub(/{W}/, mana_img("W"))
       .gsub(/{G}/, mana_img("G"))
       .gsub(/{R}/, mana_img("R"))
       .gsub(/{B}/, mana_img("B"))
       .gsub(/{U}/, mana_img("U"))
       .gsub(/{X}/, mana_img("X"))
       .gsub(/{Tap}/, mana_img("Tap"))
  end

  def mana_img (word)
    options = {}
    options[:src] = "/images/#{word}.png"
    options[:alt] = "{#{word}}"
    options[:width] = options[:height] = "10px"
    tag("img", options)
  end
end

