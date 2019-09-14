module ChildrensBooks
    class CLI

        def call 
            ChildrensBooks::Scraper.scrape
            puts ""
            puts "Welcome to the Children's Books Database!"
            puts ""
            @input = nil
            menu
            while @input != "exit" 
                @input = gets.chomp
                if @input == "1"
                    puts "Here are some books 2-4 year olds will love:"
                    books_array = ChildrensBooks::Book.preschoolbooks
                    print_books(books_array)
                elsif @input == "2"
                    puts "Here are some books 5-7 year olds will love:"
                    books_array = ChildrensBooks::Book.littlekidbooks
                    print_books(books_array)
                elsif @input == "3"
                    puts "Here are some books 8-9 year olds will love:"
                    books_array = ChildrensBooks::Book.bigkidbooks
                    print_books(books_array)
                elsif @input == "4"
                    puts "Here are some books 10-12 year olds will love:"
                    books_array = ChildrensBooks::Book.tweenbooks
                    print_books(books_array)
                elsif @input == "5"
                    puts "Here's a randomly selected book for you to try:"
                    book_obj = ChildrensBooks::Book.all.sample
                    print_book(book_obj)
                elsif @input == "menu"
                    menu
                elsif @input == "exit"
                    break
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

        def print_books(array)
            array.each do |book|
                puts ""
                puts "Title: #{book.title}"
                puts "Author: #{book.author}"
                puts "Description: #{book.description}"
                puts "Release Year: #{book.year}"
                puts "Age: #{book.age}"
                puts ""
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