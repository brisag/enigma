require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/offsets'

class OffsetsTest < MiniTest::Test
  def test_it_exists_and_has_attributes
    offset = Offset.new('0')
    test_offset = Offset.new('040895')

    assert_instance_of Offset, offset
    assert_instance_of Offset, test_offset
    assert_equal '040895', test_offset.date
    assert_equal 0, test_offset.a_offset
    assert_equal 0, test_offset.b_offset
    assert_equal 0, test_offset.c_offset
    assert_equal 0, test_offset.d_offset
  end
end
