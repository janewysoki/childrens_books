module ChildrensBooks
    class Book
        attr_accessor :title, :author, :description, :age, :year, :url
        @@all = [] 

        def initialize(title, author, description, age, year, url)
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
                book if (2..4).include?(book.age.to_i)
            end
        end

        def self.littlekidbooks
            self.all.select do |book|
                book if (5..7).include?(book.age.to_i) 
            end
        end

        def self.bigkidbooks
            self.all.select do |book|
                book if (8..9).include?(book.age.to_i) 
            end
        end

        def self.tweenbooks
            self.all.select do |book|
                book if (10..12).include?(book.age.to_i) 
            end
        end
    end
end
