class Songlist

  def initialize(songs)
    @songlist = songs
  end

  def number_of_songs
    return @songlist.count
  end

  def list_song_titles
    # binding.pry
     titles = @songlist.map{ |song| song.title}
     return titles
  end

end #of class
