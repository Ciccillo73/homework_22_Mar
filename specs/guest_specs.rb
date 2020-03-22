require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')
require_relative('../room')

class GuestTest < MiniTest::Test

  def setup()

    @guest = Guest.new("Jhonny", 30, "Unforgiven")

  end

  def test_has_name()
    assert_equal("Jhonny",@guest.name)
  end

  def test_check_has_funds()
    assert_equal(30 ,@guest.wallet)
  end


end
