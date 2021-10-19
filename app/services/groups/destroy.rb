module Groups 
    class Destroy 
    
        def initialize (id:)
            @id  = id
        end

        def execute
            group = Group.find(@id)
                          
            group.destroy  #borramos el grupo con el id guardado en la variable 'params'
            'ok'        
                  
        end
    
    end

end
