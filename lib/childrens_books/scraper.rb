require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './book'

module ChildrensBooks
    class Scraper
        def self.scrape
            html = open("https://www.commonsensemedia.org/lists/50-books-all-kids-should-read-before-theyre-12")
            doc = Nokogiri::HTML(html)
            
            doc.css(".views-row-odd").each do |node|
                title = node.css("strong.field-content a").text
                author = node.css("div.views-field-field-term-book-authors").text.strip.delete("By").split.join(" ")
                description = node.css("div.views-field-field-one-liner").text.strip
                age = node.css("div.views-field-field-review-recommended-age").text.strip.delete("age").delete("+").split.join("")
                year = node.css("div.views-field-field-canonical-date").text.strip.gsub(/[()]/, "") 
                url = node.css("strong.field-content a").attr("href").value
                ChildrensBooks::Book.new(title, author, description, age, year, url)
                binding.pry
            end
            
            doc.css(".views-row-even").each do |node|
                title = node.css("strong.field-content a").text
                author = node.css("div.views-field-field-term-book-authors").text.strip.delete("By").split.join(" ")
                description = node.css("div.views-field-field-one-liner").text.strip
                age = node.css("div.views-field-field-review-recommended-age").text.strip.delete("age").delete("+").split.join("")
                year = node.css("div.views-field-field-canonical-date").text.strip.gsub(/[()]/, "")
                url = node.css("strong.field-content a").attr("href").value
                ChildrensBooks::Book.new(title, author, description, age, year, url) 
            end
        end
    end
end

#ChildrensBooks::Scraper.scrape

