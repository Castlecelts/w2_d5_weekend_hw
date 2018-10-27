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

    @guest1 = Guest.new("James", 50, @song1)
    @guest2 = Guest.new("Alex", 8, @song2)
    @guest3 = Guest.new("Craig", 10, @song2)

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

  def test_club_has_a_entry_fee
    expected = 10
    actual = @club.entry_fee
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

  def test_till_value
    expected = 0
    actual = @club.till_value
    assert_equal(expected, actual)
  end

  def test_add_to_till_functions
    expected = 10
    @club.add_to_till(10)
    actual = @club.till_value
    assert_equal(expected, actual)
  end

  # def test_add_till_value_if_guest_can_pay
  #
  # end

  def test_club_charge_guest
    expected = 40
    @club.charge_guest(@guest1)
    actual = @guest1.guest_money
    assert_equal(expected, actual)
    expected2 = 10
    actual2 = @club.till_value
    assert_equal(expected2, actual2)
  end

  def test_club_reject_guest
    expected = "Get out of here!"
    actual = @club.charge_guest(@guest2)
    assert_equal(expected, actual)
    expected2 = 8
    actual2 = @guest2.guest_money
    assert_equal(expected2, actual2)
    expected3 = 0
    actual3 = @club.till_value
    assert_equal(expected3, actual3)
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
    expected2 = 2
    actual2 = @club.guest_count(@room2)
    assert_equal(expected2, actual2)
  end

end#of class
