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

  def test_it_can_get_starting_indices
  test_encryptor = Encryptor.new('hello world', '02715', '040895')
  new_encryptor = Encryptor.new('HelLo February@!', '02715', '040895')

  expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

  assert_equal expected, test_encryptor.index_start

  expected = [7, 4, 11, 11, 14, 26, 5, 4, 1, 17, 20, 0, 17, 24, nil, nil]

  assert_equal expected, new_encryptor.index_start

  end

  def test_it_can_generate_encoded_message
    test_encryptor = Encryptor.new('hello world', '02715', '040895')
    new_encryptor = Encryptor.new('HelLo February@!', '02715', '040895')

    expected = {encryption:'keder ohulw',
                key:'02715',
                date:'040895'}

    assert_equal expected, test_encryptor.generate_encoded_message

    expected = {encryption:'keder yyermuuy@!',
                key:'02715',
                date:'040895'}

    assert_equal expected, new_encryptor.generate_encoded_message
  end

  def test_encode_method
    test_encryptor = Encryptor.new('hello world', '02715', '040895')
    index = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    shift = [3, 27, 73, 20]

    assert_equal 'keder ohulw', test_encryptor.encode(index,shift)
  end

  def test_create_return_hash
    test_encryptor = Encryptor.new('hello world', '02715', '040895')
    test_encryptor.stubs(:key).returns('02715')
    test_encryptor.stubs(:date).returns('040895')
    expected = {encryption:'keder ohulw',
                key:'02715',
                date:'040895'}

    assert_equal expected, test_encryptor.create_return_hash('keder ohulw')
  end
end
