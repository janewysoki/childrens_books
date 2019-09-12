module ChildrensBooks
    class CLI

        def call 
            puts "Welcome to the Children's Books Database!"
            menu
            #goodbye
        end

        def menu
            puts <<-MENU
            "Select an age range to see the best children's book suggestions!"
            1. Ages 2-4
            2. Ages 5-7
            3. Ages 8-9
            4. Ages 10-12
            5. Surprise me!
            MENU
        end

        def list_books
            Book.all.each.with_index(1) do |book, index|
                puts "#{index}. #{book.title}"
            end
        end

        def list_books_by_age
            if age == 2 || 3 || 4
        end

        def surprise_me
        end
    end
end