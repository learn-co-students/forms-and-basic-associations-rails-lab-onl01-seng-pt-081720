class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist 
  belongs_to :genre
  has_many :notes

  #artist setter method
  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
    #self.save
  end

  #artist getter method
  def artist_name
    self.artist.name if self.artist
  end

  #genre setter method
  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  #genre getter method
  def genre_name
    self.genre.name if self.genre
  end

  #note_content getter method
  def note_contents
    self.notes.collect(&:content)
  end

  #note_content setter method
  def note_contents=(note_contents)
    note_contents.each do |content|
      unless content.empty?
        self.notes << Note.create(content: content)
        self.save
      end
    end
  end
end
