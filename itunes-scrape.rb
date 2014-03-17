require 'nokogiri'
require 'open-uri'
require 'colorize'

urls = %w[
	https://itunes.apple.com/us/genre/podcasts-tv-film/id1309?mt=2&letter=A
	https://itunes.apple.com/us/genre/podcasts-tv-film/id1309?mt=2&letter=A&page=2#page
	https://itunes.apple.com/us/genre/podcasts-tv-film/id1309?mt=2&letter=A&page=3#page
	https://itunes.apple.com/us/genre/podcasts-tv-film/id1309?mt=2&letter=A&page=4#page
]

	puts "START NAME".colorize(:red)
	urls.each do |url|
		doc = Nokogiri::HTML(open(url))
		name = doc.css('#selectedcontent li a').map{ |link| link.text.strip.colorize(:green) }
		puts name
	end

	puts "START EPISODES.... Press Enter to Continue".colorize(:red)
	gets
	urls.each do |url|
		doc = Nokogiri::HTML(open(url))
		href = doc.css('#selectedcontent li a').map{ |link| link['href'].colorize(:blue) }
		puts href
	end

	puts "STARTS IMAGES... Press Enter to Continue".colorize(:red)
	gets
	urls.each do |url|
		doc = Nokogiri::HTML(open(url))
		href = doc.css('#selectedcontent li a').map{ |link| link['href'] }
		href.each do |image|
		 images = Nokogiri::HTML(open(image))
		 img = images.css('#left-stack .artwork img.artwork')[0]["src"].colorize(:yellow)
		 puts img
		end
	end