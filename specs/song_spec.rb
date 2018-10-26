require ('minitest/autorun')
require ('minitest/rg')

require_relative ('../song')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    @song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")
  end #of setup

  def test_song_has_a_title
    expected = "Everybody (Backstreet's Back)"
    actual = @song1.title
    assert_equal(expected, actual)
  end

  def test_song_has_an_artist
    expected = "Will Smith"
    actual = @song2.artist
    assert_equal(expected, actual)
  end


















end#of class
