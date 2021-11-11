module Albums 

    class Search 
        def initialize(name: nil) 
            @name = name
        end

        def execute 
            albums = Album.all 
            albums = albums.where(name: @name) if @name 
            albums
        end
    end
end