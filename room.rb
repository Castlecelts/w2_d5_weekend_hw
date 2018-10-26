class Room

  attr_accessor :room_name, :capacity

  def initialize(room_name, capacity, songlist)
    @room_name = room_name
    @capacity = capacity
    @songlist = songlist
    @playlist = []
  end


end #of class
