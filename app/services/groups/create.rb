module Groups 
    class Create 
        
        def initialize(group_params:) 
            @group_params = group_params
        end

        def execute 
            Group.create(@group_params)            
        end


    end
end