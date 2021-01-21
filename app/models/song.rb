class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name if self.artist
 end

 def song_genre=(name)
  self.genre = Genre.find_or_create_by(name: name)
 end

 def song_genre
  self.genre.name if self.genre
 end

 def note_content=(contents)
  contents.each do |content|
    if content.strip != "" 
      self.notes.build(content: content)
    end
  end
 end

 def note_content
  self.notes.map(&:content)
 end


end
