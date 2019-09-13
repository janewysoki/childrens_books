require 'pry'
require_relative './book.rb'
require_relative './scraper.rb'

module ChildrensBooks
    class CLI

        def call 
            ChildrensBooks::Scraper.scrape
            puts ""
            puts "Welcome to the Children's Books Database!"
            puts ""
            @input = nil #ask what this does and why input is an instance variable
            menu
            while @input != "exit"
                @input = gets.chomp
                if @input == "1"
                    puts "Here are some books 2-4 year olds will love:"
                    print_preschoolbooks
                elsif @input == "2"
                    puts "Here are some books 5-7 year olds will love:"
                elsif @input == "3"
                    puts "Here are some books 8-9 year olds will love:"
                elsif @input == "4"
                    puts "Here are some books 10-12 year olds will love:"
                elsif @input == "5"
                    puts "Here's a randomly selected book for you to try:"
                    #ChildrensBooks::Book.surprise_me
                elsif @input == "menu"
                    menu
                elsif @input == "exit"
                    
                else 
                    puts "Sorry, you did not select a valid number. Please try again."
                    puts ""
                    menu
                end
            end
            
            puts "Thanks for visiting. I hope you're headed out to the bookstore!" #IS THIS BETTER UNDER LINE 24?
        end

        def menu
            puts "Select an age range to see the best children's book suggestions!"
            puts ""
            puts <<-MENU
            1. Ages 2-4
            2. Ages 5-7
            3. Ages 8-9
            4. Ages 10-12
            5. Surprise me!
            Type "exit" to leave the program.
            Type "menu" at any time to return to menu.
            MENU
            puts ""
        end

        def print_preschoolbooks
            ChildrensBooks::Book.preschoolbooks.each do |preschool_book|
                puts ""
                puts "Title: #{preschool_book.title}"
                puts "Author: #{preschool_book.author}"
                puts "Description: #{preschool_book.description}"
                puts "Release Year: #{preschool_book.year}"
                puts ""
            end
        end
    end
end

#puts ChildrensBooks::Book.print_preschoolbooks #.each do |preschool_book|
                        #puts ""
                        #puts "Title: #{preschool_book.title}"
                        #puts "Author: #{preschool_book.author}"
                        #puts "Description: #{preschool_book.description}"
                        #puts "Release Year: #{preschool_book.year}"
                        #puts ""
                    #end