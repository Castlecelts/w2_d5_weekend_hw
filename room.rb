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

  def add_guest(name)
    @current_guests << name
  end

  def delete_guest(name)
    @current_guests.delete_if{ |guest| guest == name}
  end

  def guest_happiness(specific_guest)
    song_of_guest = specific_guest.fav_song
    for guest in @current_guests
      if guest == specific_guest && specific_guest.fav_song == @songlist.find_by_song(song_of_guest)
        return specific_guest.excitment(song_of_guest)
      else
        return "Gutted!"
      end
    end
  end



end #of class
