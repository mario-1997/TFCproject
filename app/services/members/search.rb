module Members 
    class Search 
        
        def initialize(name: nil)
            @name = name
        end

        def execute 
            members = Member.all
            members = members.where(name: name) if @name 
            members 
        end
    end

end