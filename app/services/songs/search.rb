module Songs 

    class Search 
        def initialize(name: nil) 
            @name = name
        end

        def execute 
            songs = Song.all 
            songs = spngs.where(name: @name) if @name 
            songs
        end
    end
end