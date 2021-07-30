 class Song 

    @@all = []

    attr_accessor :name 
    attr_reader :artist, :genre

    def initialize(name, artist = nil, genre = nil)
        @name = name
        self.artist = artist if artist
        self.genre = genre if genre

        
    end 

    def self.all 
        @@all 
    end 


    def self.destroy_all
        @@all.clear
    end
    
    def save
        self.class .all << self
    end
    
    def self.create(title)
        title = Song.new(title)
        title.save
        title
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end 

    def genre=(genre)
        @genre = genre
        
    end

    def self.find_by_name(name)
        self.all.detect {|s| s.name == name}
    end

    def self.find_or_create_by_name(name)
        self.find_by_name(name) || self.create(name)
    end




    

    

    

end 