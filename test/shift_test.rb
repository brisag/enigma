require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'
require './lib/offsets'
require './lib/shift'

class ShiftTest < MiniTest::Test
  def test_it_exists_and_has_attributes
    test_shift = Shift.new('02715', '040895')

    assert_instance_of Shift, Shift.new(Key.new('02715'), Offset.new('040895'))
    assert_equal '02715', test_shift.key
    assert_equal '040895', test_shift.offset
    assert_equal [], test_shift.shifts
  end

  def test_it_can_generate_offset
    key = Key.new('02715')
    key.create_keys

    offset = Offset.new('040895')
    offset.create_offset

    test_shift = Shift.new(key, offset)
    test_shift.generate

    assert_equal [3, 27, 73, 20], test_shift.shifts
  end
end
