require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryptor'
require './lib/offsets'
require './lib/shift'
require './lib/keys'
require 'mocha'
require 'date'

class DecryptorTest < MiniTest::Test
  def test_it_exists
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')

    assert_instance_of Decryptor, test_decryptor
  end

  def test_it_has_attributes
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')

    assert_equal 'keder ohulw', test_decryptor.message
    assert_equal '02715', test_decryptor.key
    assert_equal '040895', test_decryptor.date
    assert_equal [], test_decryptor.decoded_message
  end

  def test_it_can_get_shifts
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')

    assert_equal [3, 27, 73, 20], test_decryptor.get_shifts
  end

  def test_it_can_get_starting_indices
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    expected = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]

    assert_equal expected, test_decryptor.index_start
  end

  def test_it_can_generate_decoded_message
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    index = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, nil]
    shift = [3, 27, 73, 20]
    expected = {decryption: 'hello world',
                key: '02715',
                date: '040895'}

    assert_equal expected, test_decryptor.generate_decoded_message
  end

  def test_decode_method
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    index = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22, nil]
    shift = [3, 27, 73, 20]

    assert_equal 'hello world', test_decryptor.decode(index,shift)
  end

  def test_create_return_hash
    test_decryptor = Decryptor.new('keder ohulw', '02715', '040895')
    test_decryptor.stubs(:key).returns('02715')
    test_decryptor.stubs(:date).returns('040895')
    expected = {encryption:'keder ohulw',
                key:'02715',
                date:'040895'}

    assert_equal expected, test_decryptor.create_return_hash('keder ohulw')
  end
end
