require "pry"

class MusicImporter
     
    attr_reader :path 

    def initialize(path)
        @path = path 
    end

    def files
        @files = Dir[@path+"/*"]
        var =  @files.collect{ |f| f.gsub("#{path}/", "") }
       
       
    end
   
    
    def import
        files.each{ |f| Song.create_from_filename(f) }
      end

end

