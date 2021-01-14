class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song

  def song_ids=(ids)
    ids.each do |id|
      note = Song.find(id)
      self.notes << note
    end
  end
end
