module Groups
    class Search 

        def initialize(name: nil)
            @name = name
            
        end

        def execute
            groups = Group.all 
            
            
            groups = groups.where(name: @name) if @name
            
            groups 

            
        end



    end
end    