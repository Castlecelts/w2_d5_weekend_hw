# require_relative('songlist')

class Room

  attr_accessor :room_name, :capacity

  def initialize(room_name, capacity, songlist)
    @room_name = room_name
    @capacity = capacity
    @songlist = songlist
    @playlist = []
    @current_guests = []
  end


  def available_songs
    @songlist.list_all_songs
  end

  def available_by_titles
     @songlist.list_song_titles
  end

  def available_by_artists
    @songlist.list_song_artists
  end

  def search_by_title(song_title)
    @songlist.find_by_title(song_title)
  end

  def search_by_artist(artist)
    @songlist.find_by_artist(artist)
  end

  def size_of_playlist
    @playlist.count
  end

  def add_to_playlist(song)
    @playlist << song
    return @playlist
  end

  def number_of_guests
    @current_guests.count
  end




end #of class
