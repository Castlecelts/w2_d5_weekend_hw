require ('minitest/autorun')
require ('minitest/rg')

require_relative ('../guest')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("James", 50)
    @guest2 = Guest.new("Alex", 8)
    @guest3 = Guest.new("Craig", 10)

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



end#of class
