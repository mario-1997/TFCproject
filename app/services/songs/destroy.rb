module Songs
    class Destroy 
    
        def initialize (id:)
            @id  = id
        end

        def execute
            song = Song.find(@id)                          
            song.destroy  #borramos el grupo con el id guardado en la variable 'params'                 
        end    
    end
end