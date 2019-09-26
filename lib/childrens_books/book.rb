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

        def self.books_by_age(age_range)
            age_array = age_range.split("-")
            start_num = age_array[0].to_i
            end_num = age_array[1].to_i
            (start_num..end_num)
            self.all.select do |book|
                book if (start_num..end_num).include?(book.age.to_i) 
            end
        end
    end
end
