class Songlist

  def initialize(songs)
    @songlist = songs
  end

  def number_of_songs
    return @songlist.count
  end

  def list_song_titles
     titles = @songlist.map{ |song| song.title}
     return titles
  end

  def list_song_artist
    artists = @songlist.map{ |song| song.artist}
    return artists
  end

  def list_all_songs
    songs = @songlist.map{ |song| song}
    return songs
  end

  def find_by_title(wanted_song_title)
    song_match = @songlist.find_all{ |song| song.title == wanted_song_title}
    return song_match
  end

  def find_by_artist(wanted_song_artist)
    song_match = @songlist.find_all{ |song| song.artist == wanted_song_artist}
    return song_match
  end


end #of class
