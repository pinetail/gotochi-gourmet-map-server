# -*- coding: utf-8 -*-
require "rexml/document"
require "net/http"
require "rubygems"
require "mysql2"
require 'optparse'
require 'highline'
include REXML    # so that we dxhave to prefix everything
                 # with REXML::...

def parseXml(doc)
  XPath.each( doc, "//RestaurantInfo//Item") { |element|
    begin
      esc_name             = $client.escape(element.elements["RestaurantName"].text)
      esc_address          = $client.escape(element.elements["Address"].text)
      esc_tel              = $client.escape(element.elements["Tel"].text)
      esc_category         = $client.escape(element.elements["Category"].text)
      esc_rcd              = $client.escape(element.elements["Rcd"].text)
      esc_businesshours    = element.elements["BusinessHours"].text.nil? ? '' : $client.escape(element.elements["BusinessHours"].text)
      esc_holiday          = element.elements["Holiday"].text.nil? ? '' : $client.escape(element.elements["Holiday"].text)
      esc_latitude         = $client.escape(element.elements["Latitude"].text)
      esc_longitude        = $client.escape(element.elements["Longitude"].text)
      esc_totalscore       = $client.escape(element.elements["TotalScore"].text)
      esc_tabelogurl       = $client.escape(element.elements["TabelogUrl"].text)
      esc_tabelogmobileurl = $client.escape(element.elements["TabelogMobileUrl"].text)
      esc_station          = element.elements["Station"].text.nil? ? '' : $client.escape(element.elements["Station"].text)

      puts esc_category
      
      if esc_category.include?($category)
        select = "SELECT * FROM shops WHERE tabelog_id = " + esc_rcd
        results  = $client.query(select)
        if results.count == 0 then
          puts $h.color("INSERT RCD is #{esc_rcd}.", :yellow)
          query = "INSERT INTO shops (name, address, tel, category, tabelog_id, business_hours, holiday, latitude, longitude, score, " +
                  "tabelog_url, tabelog_mobile_url, station, created_at, updated_at) values ('" + esc_name + "', '" +
                  esc_address + "',' " + esc_tel + "', '" + esc_category + "', " + esc_rcd + ", '" + esc_businesshours + "', '" +
                  esc_holiday + "', '" + esc_latitude + "', '" + esc_longitude + "', '" + esc_totalscore + "', '" + esc_tabelogurl + "', '" +
                  esc_tabelogmobileurl + "', '" + esc_station + "', '" + $day.strftime("%Y-%m-%d %H:%M:%S") + "', '" + $day.strftime("%Y-%m-%d %H:%M:%S") + "')"
        else
          puts $h.color("UPDATE RCD is #{esc_rcd}.", :yellow)
          query = "UPDATE shops SET name = '#{esc_name}', address = '#{esc_address}', tel = '#{esc_tel}', business_hours = '#{esc_businesshours}'," +
                  " holiday = '#{esc_holiday}', latitude = '#{esc_latitude}', longitude = '#{esc_longitude}', score = '#{esc_totalscore}', " +
                  " tabelog_url = '#{esc_tabelogurl}', tabelog_mobile_url = '#{esc_tabelogmobileurl}', station = '#{esc_station}', " +
                  " updated_at = '" +  $day.strftime("%Y-%m-%d %H:%M:%S") + "' WHERE tabelog_id = " + esc_rcd
        end
        #puts query
        results = $client.query(query)
      end
    rescue => exc
      puts exc
      puts element
    end
  }
end

def setCategory
  if $prefecture == 'hiroshima' then
    $category = 'お好み焼き'
  elsif $prefecture == 'kagawa' then
    $category = 'うどん'
  end
end

$h = HighLine.new
$category   = ""
$prefecture = ""
url = "/Ver2.1/RestaurantSearch/?key=6795d5b08580fa120b4cbb9789bb14afe859cf8a&ResultSet=large"

opt = OptionParser.new
opt.on('-c VAL'){|v| $category = v }
opt.on('-i VAL'){|v| $prefecture = v }
opt.parse!(ARGV)


setCategory()
url += "&Prefecture=" + $prefecture
#puts category
#puts prefecture
puts url
body = Net::HTTP.get('api.tabelog.com', url)
#body = Net::HTTP.get('ggmap.pinetail.jp', '/test.xml')
doc = REXML::Document.new(body)

$client = Mysql2::Client.new(:host => "localhost", :username => "root", :database => "gotochi-gourmet-map")

$day = Time.now

num = XPath.first(doc, "//RestaurantInfo/NumOfResult").text
#puts num

puts $category
pages = num.to_i.div(20)
puts $h.color("page num is \'" + pages.to_s + "\'.", :green)
puts $h.color("check site is \'" + url + "\'.", :yellow)
parseXml(doc)
sleep 5

for i in 2..pages
  body = Net::HTTP.get('api.tabelog.com', url + "&PageNum=" + i.to_s)
  doc = REXML::Document.new(body)
  puts $h.color("check site is \'" + url + "&PageNum=" + i.to_s + "\'.", :yellow)
  parseXml(doc)
#  puts i
  sleep 5
end
