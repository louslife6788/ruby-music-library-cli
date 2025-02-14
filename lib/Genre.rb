class Genre

    @@all = []

    attr_accessor :name

    extend Concerns::Findable

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
        name = Genre.new(name)
        name.save
        name
    end

    def songs
        Song.all.select do |s|
            s.genre == self
        end
    end

    def artists
        songs.map do |s|
            s.artist
        end.uniq

    end


end