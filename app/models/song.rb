class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist 
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_name=(name)
    
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end

  def notes_content=(contents)
    contents.each do |content|
      self.notes.build(content: content)
    end
  end
end
