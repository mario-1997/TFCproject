module Albums
    class Destroy 
    
        def initialize (id:)
            @id  = id
        end

        def execute
            album = Album.find(@id)                          
            album.destroy  #borramos el grupo con el id guardado en la variable 'params'                 
        end    
    end
end