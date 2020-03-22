require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class SongTest < Minitest::Test

  def setup()
    @song = Song.new("Madonna","Like a virgin")
  end

  def test_has_an_artist_name()
    assert_equal("Madonna", @song.artist)
  end

  def test_has_an_a_title()
    assert_equal("Like a virgin", @song.title)
  end


end
