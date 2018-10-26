require ('MiniTest/autorun')
require ('minitest/rg')

require_relative('../room')
require_relative('../songlist')
require_relative('../song')

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

    @room1 = Room.new(@room_name1, @capacity, @songlist1)

  end#of setup

  def test_room_has_a_name
    expected = "90's Pop"
    actual = @room1.room_name
    assert_equal(expected, actual)
  end


end#of class
