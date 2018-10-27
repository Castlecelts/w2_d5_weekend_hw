require ('MiniTest/autorun')
require ('MiniTest/rg')

require ('pry')

require_relative ('../songlist')
require_relative ('../song')


class TestSonglist < MiniTest::Test

  def setup
    @song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    @song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")
    @songs = [@song1, @song2]

    @songlist1 = Songlist.new(@songs)
  end

  def test_songlist_returns_number_of_songs
    expected = 2
    actual = @songlist1.number_of_songs
    assert_equal(expected, actual)
  end

  def test_songlist_returns_all_song_titles_in_array
    expected = ["Everybody (Backstreet's Back)", "Men in Black"]
    actual = @songlist1.list_song_titles
    assert_equal(expected, actual)
  end

  def test_songlist_returns_all_song_artists_in_array
    expected = [" The Backstreet Boys", "Will Smith"]
    actual = @songlist1.list_song_artists
    assert_equal(expected, actual)
  end

  def test_songlist_returns_array_of_titles_with_artist
    expected = @songs
    actual = @songlist1.list_all_songs
    assert_equal(expected, actual)
  end

  def test_songlist_can_find_all_songs__by_title
    expected = [@song1]
    actual = @songlist1.find_by_title("Everybody (Backstreet's Back)")
    assert_equal(expected, actual)
  end

  def test_songlist_can_find_all_songs__by_artist
    expected = [@song2]
    actual = @songlist1.find_by_artist("Will Smith")
    assert_equal(expected, actual)
  end

  def test_songlist_can_find_all_songs__by_song
    expected = @song2
    actual = @songlist1.find_by_song(@song2)
    assert_equal(expected, actual)
  end





end #of class
