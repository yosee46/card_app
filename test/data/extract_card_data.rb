# -*- encoding: utf-8 -*-
String text = ""
record_num = 1;
File.open("card_data.txt") do |f|
  f.each do |line|
    if (line =~ %r{<img src="(.*?)" class="listimg" style="float: right;">})
      puts "#{record_num}:"
      record_num += 1
      puts "  card_img_path: '" + $1 + "'"
    elsif (line =~ %r{<h4 class="cardname">(.*)</h4>})
      puts "  card_name: '" + $1 + "'"
    elsif (line =~ %r{<div class="mana">(<span [^>]*>|)(.+?)(</span>|)</div>})
      puts "  mana: '" + $2 + "'"
    elsif (line =~ %r{<div class="card_type">(.*)</div>})
      puts "  type: '" + $1 + "'"
    elsif (line =~ %r{<div class="poto">(.*)</div>})
      puts "  poto: '" + $1 + "'"
    elsif (line =~ %r{<div class="text">(<small>|)(.+?)(</small>|)</div>})
      a = $2.gsub("<br>", "¥n")
      puts "  text: '" + a + "'"
    end
  end
end