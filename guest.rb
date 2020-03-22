class Guest

  attr_reader :name, :wallet, :favourite_song

  def initialize(name, wallet, favourite_song)
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
  end

  def has_enough_money(amount)
    return @wallet >= amount
  end

  def cheer_loudy(songs)
    songs.each do |song|
      return "Whoo!" if song.title == @favourite_song
    end
  end

end
