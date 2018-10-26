class Song

  attr_accessor :title, :artist

  def initialize(song)
    @title = song[:title]
    @artist = song[:artist]
  end

end#of class
