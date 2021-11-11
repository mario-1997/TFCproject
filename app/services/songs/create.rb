module Songs

    class Create 
    
        def initialize(song_params: ) 
            @song_params = song_params
        end

        def execute 
            Song.create(@song_params)
        end
    
    end
end