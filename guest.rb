class Guest

  attr_accessor :name

  def initialize (guest_name, wallet, song)
    @name = guest_name
    @wallet = wallet
    @fav_song = song
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

  def fav_song
    return @fav_song
  end

  def fav_title
    return @fav_song.title
  end

  def fav_artist
    return @fav_song.artist
  end

  def excitment(song)
    if song == @fav_song
      "Woo Woo, love this one"
    else
      "Gutted!"
    end
  end




end#class
