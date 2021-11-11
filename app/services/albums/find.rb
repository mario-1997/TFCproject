module Albums
    class Find 

        def initialize(id:) 
            @id = id
        end

        def execute 
            
            @album = Album.find_by(id: @id)
           
        end
    end 
end