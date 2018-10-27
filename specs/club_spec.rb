require ('minitest/autorun')
require ('minitest/rg')

require_relative('../club')
require_relative('../room')
require_relative('../songlist')
require_relative('../song')
require_relative('../guest')

class TestClub < MiniTest::Test

  def setup
    @song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    @song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")
    @songs = [@song1, @song2]

    @songlist1 = Songlist.new(@songs)

    @capacity1 = 10
    @capacity2 = 2

    @room_name1 = "90's Pop"
    @room_name2 = "80's Pop"

    @room1 = Room.new(@room_name1, @capacity1, @songlist1)
    @room2 = Room.new(@room_name2, @capacity2, @songlist1)

    @building_structure = [@room1, @room2]
    @location = "Prince's Street"
    @club_name = "Cheesy Mic Karaoke"

    @guest1 = Guest.new("James")
    @guest2 = Guest.new("Alex")
    @guest3 = Guest.new("Craig")

    @club = Club.new(@club_name, @location, @building_structure )
  end

  def test_club_has_a_name
    expected = "Cheesy Mic Karaoke"
    actual = @club.name
    assert_equal(expected, actual)
  end

  def test_club_has_a_location
    expected = "Prince's Street"
    actual = @club.location
    assert_equal(expected, actual)
  end

  def test_size_of_club
    expected = 2
    actual = @club.building_size
    assert_equal(expected, actual)
  end

  def test_number_of_guests_in_specific_room
    expected = 0
    actual = @club.guest_count(@room1)
    assert_equal(expected, actual)
  end

  def test_add_guest_to_specific_room
    expected = 1
    @club.accept_guest(@room1, @guest1)
    actual =@club.guest_count(@room1)
    assert_equal(expected, actual)
  end

  def test_remove_guest_from_specific_room
    expected = 1
    @club.accept_guest(@room1, @guest1)
    @club.accept_guest(@room1, @guest2)
    @club.remove_guest(@room1, @guest1)
    actual = @club.guest_count(@room1)
    assert_equal(expected, actual)
  end

  def test_room_is_too_full_for_more_guests
    expected = "Room is full"
    @club.accept_guest(@room2, @guest1)
    @club.accept_guest(@room2, @guest2)
    actual = @club.accept_guest(@room2, @guest3)
    assert_equal(expected, actual)
  end

end#of class
