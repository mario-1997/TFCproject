module Members 
    class Destroy 
        
        def initialize (id:) 
            @id = id 
            
        end

        def execute 
            member = Member.find(@id)
            member.destroy
        end
    end

end