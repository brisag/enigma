require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
# require 'mocha/minitest'
require './lib/encryptor'
require './lib/offsets'
require './lib/shift'
require './lib/keys'
# require 'mocha'
require 'date'


class EncryptorTest < MiniTest::Test
  def test_it_exists
    test_encryptor = Encryptor.new('hello world', '02715', '040895')

    assert_instance_of Encryptor, test_encryptor
  end

  def test_it_has_attributes
    new_encryptor = Encryptor.new('hello world', '02715', '040895')
    assert_equal 'hello world', new_encryptor.message
    assert_equal '02715', new_encryptor.key
    assert_equal '040895', new_encryptor.date
    assert_equal [], new_encryptor.encoded_message
    assert_equal 27, new_encryptor.alphabet.length
  end

  def test_it_can_get_shifts
    new_encryptor = Encryptor.new('hello world', '02715', '040895')

    assert_equal [3, 27, 73, 20], new_encryptor.get_shifts
  end

end
