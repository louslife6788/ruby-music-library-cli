 class Song 

    @@all = []

    attr_accessor :name , :artist

    def initialize(name, artist = nil)
        @name = name
        self.artist = artist if artist

        
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

    def artist=(name)
        @artist = name 
        name.add_song(self)
    end 


    

    

    

end 