class ChildrensBooks::CLI

    def call 
        puts "Welcome to the Children's Books Database!"
        menu
        #goodbye
    end

    def menu
        puts "Select an age range to see the best children's book suggestions!"
        1. Ages 2-4
        2. Ages 5-7
        3. Ages 8-9
        4. Ages 10-12
        5. Surprise me!
    end
end