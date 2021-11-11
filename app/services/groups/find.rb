module Groups 
    class Find 

        def initialize(id:) 
            @id = id
        end

        def execute 
            
            @group = Group.find_by(id: @id)
           
        end
    end 
end