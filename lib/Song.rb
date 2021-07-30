 
 require "pry"
 
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

    def self.new_from_filename(filename)
        title = filename.split(" - ")
        artist_name = title[0].chomp
        song_name = title[1].chomp
        genre_name = title[2].gsub('.mp3','')
        
        artist = Artist.find_or_create_by_name(artist_name)
        genre = Genre.find_or_create_by_name(genre_name)

        new(song_name, artist, genre)
           
    end

    def self.create_from_filename(filename)
        new_from_filename(filename).save
      end

end 