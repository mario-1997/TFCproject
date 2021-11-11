module Concerts 

    class Search 
        def initialize(name: nil) 
            @name = name
        end

        def execute 
            concerts = Concert.all 
            concerts = concerts.where(name: @name) if @name 
            concerts
        end
    end
end