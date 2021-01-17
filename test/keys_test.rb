require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/keys'

class KeyTest < MiniTest::Test
  def test_it_exist_and_has_attributes
    key = Key.new('0')
    test_key = Key.new('02715')

    assert_instance_of Key, key
    assert_instance_of Key, test_key
    assert_equal '02715', test_key.key
    assert_equal 0, test_key.a_key
    assert_equal 0, test_key.b_key
    assert_equal 0, test_key.c_key
    assert_equal 0, test_key.d_key
  end

  def test_it_can_create_keys
    test_key = Key.new('02715')
    test_key.create_keys

    assert_equal 02, test_key.a_key
    assert_equal 27, test_key.b_key
    assert_equal 71, test_key.c_key
    assert_equal 15, test_key.d_key
  end
end
