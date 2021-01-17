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
