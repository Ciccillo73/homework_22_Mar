class Room
    attr_accessor :name, :songs, :capacity, :guests, :till
    def initialize(name, songs, capacity, fee)
      @name = name
      @songs = songs
      @capacity = capacity
      @guests = []
      @fee = fee
      @till = 0
    end

    def guest_count()
      @guests.length
    end

    def add_fee_register()
      @till += @fee
    end

    def check_playlist(list)
      playlist = list.map {|song| song.title}
      return playlist
    end

    def find_song_by_first_letter_title(list, first_letter)
      list.find {|song| song.title[0] == first_letter}
    end

    def check_in_guest(guest)
      guest.has_enough_money(@fee)
      add_fee_register()
      @guests.push(guest)
    end

    def check_out_guest(guest)
      removed = @guests.delete(guest)
      return removed.name
    end

    def check_in_guests(guests)
      guests.each{|guest| check_in_guest(guest)}
    end

    def check_out_guests()
      @guests = []
    end

    def check_free_space()
      return @capacity - @guests.length
    end

    def not_enough_space(group)
      check_in_guests(group)
      return true if check_free_space() < 0
    end


end
