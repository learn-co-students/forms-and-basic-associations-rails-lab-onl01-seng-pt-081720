
  class Song < ActiveRecord::Base
    # add associations here
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def artist_name=(name)
      # FIND AN ARTIST by the USER INPUT :NAME - OR MAKE A NEW ONE WITH THAT STRING
      # hand in an object - ASSIGN OBJECT TO SONG.ARTIST
      self.artist= Artist.find_or_create_by(:name => name)
    end

    def artist_name
      self.artist ? self.artist.name : nil
    end

# I DONT UNDERSTAND ANY OF THIS
    def song_notes=(notes)
      notes.each do |note|
        self.notes.build(content: note)
      end
    end
  
    def song_notes
      self.notes.map(&:content)
    end

  end
