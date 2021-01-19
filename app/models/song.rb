class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre 
  has_many :notes 

  #set and get artist name

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  #set and get genre

  def genre_name=(name)
    self.genre = genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  def song_notes
    self.notes.map(&:content)
  end

end
