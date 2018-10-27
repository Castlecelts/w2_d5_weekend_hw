require ('minitest/autorun')
require ('minitest/rg')

require_relative ('../guest')
require_relative ('../song')


class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new(
      :title => "Everybody (Backstreet's Back)",
      :artist => " The Backstreet Boys")
    @song2 = Song.new(
      :title => "Men in Black",
      :artist => "Will Smith")

    @guest1 = Guest.new("James", 50, @song1)
    @guest2 = Guest.new("Alex", 8, @song2)
    @guest3 = Guest.new("Craig", 10, @song1)

  end#setup

  def test_guest_has_a_name
    expected = "James"
    actual = @guest1.name
    assert_equal(expected, actual)
  end

  def test_guest_has_money
    expected = 50
    actual = @guest1.guest_money
    assert_equal(expected, actual)
  end

  def test_guest_pay_fee
    expected = 40
    actual = @guest1.guest_pay(10)
    assert_equal(expected,actual)
  end

  def test_guest_cant_pay
    expected = "I can't pay"
    actual = @guest2.guest_pay(10)
    assert_equal(expected, actual)
  end

  def test_guest_exactly_can_pay
    expected = 0
    actual = @guest3.guest_pay(10)
    assert_equal(expected, actual)
  end

  def test_guest_has_a_fav_song
    expected = @song1
    actual = @guest1.fav_song
    assert_equal(expected, actual)
  end

  def test_guest_has_a_fav_title
    expected = "Everybody (Backstreet's Back)"
    actual = @guest1.fav_title
    assert_equal(expected, actual)
  end

  def test_guest_has_a_fav_artist
    expected = "Will Smith"
    actual = @guest2.fav_artist
    assert_equal(expected, actual)
  end

  def test_guest_is_excited
    expected = "Woo Woo, love this one"
    actual = @guest1.excitment(@song1)
    assert_equal(expected, actual)
  end

  def test_guest_is_disappointed
    expected = "Gutted!"
    actual = @guest2.excitment(@song1)
    assert_equal(expected, actual)
  end


end#of class
