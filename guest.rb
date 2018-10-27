class Guest

  attr_accessor :name

  def initialize (guest_name, wallet)
    @name = guest_name
    @wallet = wallet
  end

  def guest_money
    return @wallet
  end

  def guest_pay(cost)
    if @wallet >= cost
      return @wallet -= cost
    else
      return "I can't pay"
    end
  end

end#class
