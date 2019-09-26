require 'pry'
module ChildrensBooks
    class CLI
        @@ages = ["2-4", "5-7", "8-9", "10-12"]
        def call 
            ChildrensBooks::Scraper.scrape
            puts ""
            puts "Welcome to the Children's Books Database!".magenta
            puts ""
            @input = nil
            menu
            while @input != "exit" 
                @input = gets.chomp
                if (1..4).include?(@input.to_i)
                    index = @input.to_i - 1 
                    puts "Here are some books #{@@ages[index]} year olds will love:".green
                    books_array = ChildrensBooks::Book.books_by_age(@@ages[index])
                    print_books(books_array)
                    puts "Enter 'menu' for more options or 'exit' to leave the program.".green
                elsif @input == "5"
                    puts "Here's a randomly selected book for you to try:".green
                    book_obj = ChildrensBooks::Book.all.sample
                    print_book(book_obj) 
                    puts "Enter 'menu' for more options or 'exit' to leave the program.".green
                elsif @input == "menu"
                    menu
                elsif @input == "exit"
                    break
                else 
                    puts "Sorry, you did not select a valid number. Please try again.".red
                    puts ""
                    menu
                end
            end
            puts "Thanks for visiting. I hope you're headed out to the bookstore!".magenta
        end
      
        def menu
            puts "Select an age range to see the best children's book suggestions!".cyan
            puts ""
            @@ages.each.with_index(1) do |range, index|
                puts "#{index}. Ages #{range}"
            end
            puts "5. Surprise me!"
            puts "Type 'exit' to leave the program."
            puts "Type 'menu' at any time to return to menu."
            puts ""
        end

        def print_books(array)
            array.each do |book|
                print_book(book)
            end
        end

        def print_book(book)
                puts ""
                puts "Title: #{book.title}"
                puts "Author: #{book.author}"
                puts "Description: #{book.description}"
                puts "Release Year: #{book.year}"
                puts "Age: #{book.age}"
                puts ""
        end
    end
end


