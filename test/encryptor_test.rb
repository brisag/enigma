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

class EncryptorTest < Minitest::Test
  def setup
    @encryptor = Encryptor.new
  end

  def test_it_exists
    assert_instance_of Encryptor, @encryptor
  end

  def test_initialize
  @encryptor = Encryptor.new

    assert_equal 180121, @encryptor.todays_date
  end

  def test_square_date
    assert_equal 32443574641, @encryptor.square_date
    assert_equal 1672401025, @encryptor.square_date("040895")
  end

  def test_last_four_digits

    assert_equal 4641, @encryptor.last_four_digits
    assert_equal 1025, @encryptor.last_four_digits("040895")
  end
end
#
