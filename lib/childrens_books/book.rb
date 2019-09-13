require 'pry'
#require_relative './scraper.rb'
#require_relative './cli.rb'

module ChildrensBooks
    class Book
        attr_accessor :title, :author, :description, :age, :year, :url
        @@all = []

        def initialize(title, author, description, age, year, url)  #try passing in attributes hash and metaprogram instead
            @title = title
            @author = author
            @description = description
            @age = age
            @year = year
            @url = url
            @@all << self
        end

        def self.all
            @@all
        end

        def self.preschoolbooks
            self.all.select do |book|
               book if (2..4).to_a.include?(book.age.to_i) 
            end
        end

        def self.littlekidbooks
            self.all.select do |book|
                book if (5..7).to_a.include?(book.age.to_i) 
             end
        end

        def self.bigkidbooks
            self.all.select do |book|
                book if (8..9).to_a.include?(book.age.to_i) 
             end
        end

        def self.tweenbooks
            self.all.select do |book|
                book if (10..12).to_a.include?(book.age.to_i) 
             end
        end

        def self.surprise_me
            self.all.sample
        end

    end
end
