require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../song')
require_relative('../guest')

class RoomTest < Minitest::Test

    def setup()
      @song1 = Song.new("Led Zeppelin", "Thunder")
      @song2 = Song.new("Iron Maiden", "Fear The Dark")
      @song3 = Song.new("Metallica", "Unforgiven")
      @song4 = Song.new("Black Sabbath", "War Pigs")
      @song5 = Song.new("Dire Straits", "Brothers in Arms")

      @songs1 = [@song1, @song3, @song4]
      @songs2 = [@song2, @song5]
      @song_playlist = [@song1, @song2, @song3, @song4, @song5]
      @room = Room.new("Yellow",@songs, 3, 20)

      @guest1 = Guest.new("Anthony", 40, "Unforgiven")
      @guest2 = Guest.new("Mary", 50, "Fear The Dark")
      @guest3 = Guest.new("Cris", 10, "Escape")
      @guest4 = Guest.new("John", 23, "The new era")

      @guests = [@guest1, @guest2, @guest3]

    end

    def test_has_name()
      assert_equal("Yellow", @room.name)
    end

    def test_can_have_songs()
      assert_equal(3, @songs1.length)
    end

    def test_has_room_playlist()
    list = ["Thunder", "Fear The Dark", "Unforgiven", "War Pigs", "Brothers in Arms"]
      assert_equal(list, @room.check_playlist(@song_playlist))
    end

    def test_find_song_by_first_letter()
      result = @room.find_song_by_first_letter_title(@song_playlist, "F")
      assert_equal(@song2, result )
    end

    def test_check_in_guest()
      @room.check_in_guest(@guest1)
      assert_equal(1, @room.guest_count())
    end

    def test_check_out_guest()
      @room.check_in_guest(@guest1)
      @room.check_in_guest(@guest2)
      result = @room.check_out_guest(@guest2)
      assert_equal("Mary", result )
      assert_equal(1, @room.guest_count())
    end

    def test_guests_check_in()
      @room.check_in_guests(@guests)
      assert_equal(3, @room.guest_count)
    end

    def check_out_guests()
      @room.check_in_guests(@guests)
      @room.check_out_guests(@guests)
      assert_equal([], @room.guest_count)
    end

    def test_not_enough_space()
      group = [@guest1, @guest2, @guest3, @guest4]
      assert_equal(true, @room.not_enough_space(group))
    end

    def test_favourite_song_room_playlist()
      room2 = Room.new("Green", @songs2, 6, 15)
      songs2 = room2.songs
      @room.check_in_guests(@guests)
      result = @guests[1].cheer_loudy(songs2)
      assert_equal("Whoo!", result )
    end


end
