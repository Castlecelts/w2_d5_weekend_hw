class Club

  attr_accessor :name, :location

  def initialize(club_name, location, building_structure)
    @name = club_name
    @location = location
    @building_structure = building_structure
  end

  def building_size
    @building_structure.count
  end

  def guest_count(room)
    room.number_of_guests
  end

  def accept_guest(room, guest)
    room.add_guest(guest)
  end

  def remove_guest(room, guest)
    room.delete_guest(guest)
  end


end#of class
