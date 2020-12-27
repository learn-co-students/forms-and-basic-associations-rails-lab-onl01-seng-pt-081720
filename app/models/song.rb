class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  #sets the artist to the artist specified name, instead of an ID
  # this method is called whenever SOng is initialized with a artist_name field
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  #returns the artist name
  def artist_name
    self.artist ? self.artist.name : nil
  end

  #sets genre
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #returns the genre name
  def genre_name
    self.genre ? self.genre.name : nil
  end

  #iterate through note an "build it"
  def song_notes=(notes)
    notes.each do |note|
      self.notes.build(content: note)
    end
  end

  def song_notes
    self.notes.map(&:content)
  end
end
