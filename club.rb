class Club

  attr_accessor :name, :location, :entry_fee

  def initialize(club_name, location, building_structure)
    @name = club_name
    @location = location
    @building_structure = building_structure
    @entry_fee = 10
    @till = 0
  end

  def building_size
    @building_structure.count
  end

  def guest_count(room)
    room.number_of_guests
  end
  
  def till_value
    return @till
  end

  def add_to_till(charge)
    @till += charge
  end

  def charge_guest(guest)
    if guest.guest_money >= @entry_fee
      guest.guest_pay(@entry_fee)
      @till += @entry_fee
    else
      return "Get out of here!"
    end
  end

  def accept_guest(room, guest)
    if room.number_of_guests >= room.capacity
      return "Room is full"
    else
    # room.number_of_guests <= room.capacity ?
     room.add_guest(guest)
     # : p "Room is full"
   end
  end

  def remove_guest(room, guest)
    room.delete_guest(guest)
  end


end#of class
