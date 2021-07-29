class Artist

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

    def self.create(name)
        name = Artist.new(name)
        name.save
        name
    end

    def songs 
        Song.all.select { |s| s.artist == self }
      end
    

    def add_song(song)
        if not song.artist == self 
            song.artist = self
        end
    end


end
