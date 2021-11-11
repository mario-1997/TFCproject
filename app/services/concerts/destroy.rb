module Concerts
    class Destroy 
    
        def initialize (id:)
            @id  = id
        end

        def execute
            concert = Concert.find(@id)                          
            concert.destroy  #borramos el grupo con el id guardado en la variable 'params'                 
        end    
    end
end