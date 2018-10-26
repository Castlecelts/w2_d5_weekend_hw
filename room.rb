# require_relative('songlist')

class Room

  attr_accessor :room_name, :capacity

  def initialize(room_name, capacity, songlist)
    @room_name = room_name
    @capacity = capacity
    @songlist = songlist
    @playlist = []
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




end #of class
