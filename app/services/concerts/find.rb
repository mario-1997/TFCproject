module Concerts
    class Find 

        def initialize(id:) 
            @id = id
        end

        def execute 
            
            @concert = Concert.find_by(id: @id)
           
        end
    end 
end