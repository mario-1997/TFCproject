module Albums

    class Create 
    
        def initialize(album_params: ) 
            @album_params = album_params
        end

        def execute 
            Album.create(@album_params)
        end
    
    end
end