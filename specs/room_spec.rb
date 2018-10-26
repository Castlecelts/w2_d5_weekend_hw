require ('MiniTest/autorun')
require ('minitest/rg')

require_relative('../room')
require_relative('../songlist')
require_relative('../song')
require_relative('../guest')


class TestRoom < MiniTest::Test

  def setup
    @song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    @song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")
    @songs = [@song1, @song2]

    @songlist1 = Songlist.new(@songs)

    @capacity = 10
    @room_name1 = "90's Pop"

    # @playlist1 = [] not needed currently always empty
    @guest1 = Guest.new("James")


    @room1 = Room.new(@room_name1, @capacity, @songlist1)

  end#of setup

  def test_room_has_a_name
    expected = "90's Pop"
    actual = @room1.room_name
    assert_equal(expected, actual)
  end

  def test_room_has_a_capacity
    expected = 10
    actual = @room1.capacity
    assert_equal(expected, actual)
  end

  def test_room_has_a_songlist
    expected = @songs
    actual = @room1.available_songs
    assert_equal(expected, actual)
  end

  def test_room_has_songs__by_title
    expected = ["Everybody (Backstreet's Back)", "Men in Black"]
    actual = @room1.available_by_titles
    assert_equal(expected, actual)
  end

  def test_room_has_songs__by_artist
    expected = [" The Backstreet Boys", "Will Smith"]
    actual = @room1.available_by_artists
    assert_equal(expected, actual)
  end

  def test_room_can_find_all_song__by_title
    expected = [@song1]
    actual = @room1.search_by_title("Everybody (Backstreet's Back)")
    assert_equal(expected, actual)
  end

  def test_room_can_find_all_songs__by_artist
    expected = [@song2]
    actual = @room1.search_by_artist("Will Smith")
    assert_equal(expected, actual)
  end

  def test_size_of_room_playlist
    expected = 0
    actual = @room1.size_of_playlist
    assert_equal(expected, actual)
  end

  def test_room_can_add_song_to_playlist
    expected = 1
    @room1.add_to_playlist(@song1)
    actual = @room1.size_of_playlist
    assert_equal(expected, actual)
  end

  def test_size_of_room_playlist__non_0
    expected = 3
    @room1.add_to_playlist(@song1)
    @room1.add_to_playlist(@song1)
    @room1.add_to_playlist(@song1)
    actual = @room1.size_of_playlist
    assert_equal(expected, actual)
  end

  def test_number_of_guests_in_room
    expected = 0
    actual = @room1.number_of_guests
    assert_equal(expected, actual)
  end

  def test_add_guest_to_room
    expected = 1
    @room1.add_guest(@guest1)
    actual = @room1.number_of_guests
  end

  def test_delete_guest_from_room
    expected = 1
    @room1.add_guest(@guest1)
    @room1.add_guest(@guest2)
    @room1.delete_guest(@guest1)
    actual = @room1.number_of_guests
  end


end#of class
