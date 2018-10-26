require ('MiniTest/autorun')
require ('MiniTest/rg')

require ('pry')

require_relative ('../songlist')
require_relative ('../song')


class TestSonglist < MiniTest::Test

  def setup
    song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")
    songs = [song1, song2]

    @songlist1 = Songlist.new(songs)
  end

  def test_songlist_returns_number_of_songs
    expected = 2
    actual = @songlist1.number_of_songs
    assert_equal(expected, actual)
  end

  def test_songlist_returns_all_songs_in_list
    expected = ["Everybody (Backstreet's Back)", "Men in Black"]
    actual = @songlist1.list_song_titles
    assert_equal(expected, actual)
  end








end #of class
