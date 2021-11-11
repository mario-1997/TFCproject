module Songs
    class Find 

        def initialize(id:) 
            @id = id
        end

        def execute 
            
            @song = Song.find_by(id: @id)
           
        end
    end 
end