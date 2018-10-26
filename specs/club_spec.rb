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

    @club = Club.new(@club_name, @location, @building_structure )
  end

  def test_club_has_a_club_name
    expected = "Cheesy Mic Karaoke"
    actual = @club.name
    assert_equal(expected, actual)
  end




end#of class
