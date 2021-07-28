 class Song 

    @@all = []

    attr_accessor :name 

    def initialize(name)
        @name = name
        
    end 

    def self.all 
        @@all 
    end 


    def self.destroy_all
        @@all.clear
    end
    
    def save
        @@all << self
    end
    
    def self.create(title)
        title = Song.new(title)
        title.save
        title
    end
    

    

    

end 