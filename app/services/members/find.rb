module Members 
    class Find 
        
        def initialize (id: )
            @id = id
        end

        def execute 
            @member = Member.find_by(id: @id)
        end
    end
end