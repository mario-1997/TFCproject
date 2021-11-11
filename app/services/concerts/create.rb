module Concerts 

    class Create 
    
        def initialize(concert_params: ) 
            @concert_params = concert_params
        end

        def execute 
            Concert.create(@concert_params)
        end
    
    end
end