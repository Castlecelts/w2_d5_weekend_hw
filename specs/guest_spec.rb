require ('minitest/autorun')
require ('minitest/rg')

require_relative ('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("James")
    @guest2 = Guest.new("Alex")
  end#setup

  def test_guest_has_a_name
    expected = "James"
    actual = @guest1.name
    assert_equal(expected, actual)
  end



end#of class
