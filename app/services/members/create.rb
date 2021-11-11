module Members 
    class Create 
        def initialize(member_params: )
            @member_params = member_params
        end

        def execute 
            Member.create(@member_params)
        end
    
    end
end