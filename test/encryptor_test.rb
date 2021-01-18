require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/encryptor'
require './lib/offsets'
require './lib/shift'
require './lib/keys'
require 'mocha'
require 'date'

class EncryptorTest < MiniTest::Test
  def test_it_exists_and_has_attributes
    test_encryptor = Encryptor.new('hello world', '02715', '040895')

    assert_instance_of Encryptor, test_encryptor
    assert_equal 'hello world', test_encryptor.message
    assert_equal '02715', test_encryptor.key
    assert_equal '040895', test_encryptor.date
    assert_equal [], test_encryptor.encoded_message
  end

  def test_it_can_get_shifts
    test_encryptor = Encryptor.new('hello world!', '02715', '040895')

    assert_equal [3, 27, 73, 20], test_encryptor.get_shifts
  end

end
