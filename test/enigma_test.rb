require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryptor'
require './lib/encryptor'
require './lib/enigma'
require './lib/keys'
require './lib/offsets'
require './lib/shift'
require 'mocha'
require 'date'

class EnigmaTest < MiniTest::Test
	def test_it_exists
		enigma = Enigma.new
		assert_instance_of Enigma, enigma
	end

  def test_it_can_encrypt_message_with_a_key_and_message
    enigma = Enigma.new
    expected = {encryption: 'keder ohulw',
                key:        '02715',
                date:       '040895'}

    assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
  end

	def test_it_can_decrypt_message_with_a_key_and_message
    enigma = Enigma.new
    expected = {decryption: 'hello world',
                key:        '02715',
                date:       '040895'}

    assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')
	end

	 def test_encrypt_a_message_with_a_key_using_todays_date
		 Date.stubs(:today).returns(Date.new(1995,8,4))
	   enigma = Enigma.new
	   expected = {encryption: 'keder ohulw',
			 						key: '02715',
									date: '040895'}

		assert_equal expected, enigma.encrypt('hello world', '02715')
	 end

	 def test_it_can_decrypt_a_message_using_todays_date
		 Date.stubs(:strftime).returns(Date.new(2020,4,20))
			enigma = Enigma.new
			encrypted = enigma.encrypt('hello world', '02715')
			expected = {decryption: 'hello world',
									key: '02715',
									date: '180121'}

		assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715')
	end

	def test_generate_key
		skip
		enigma = Enigma.new

		assert_equal '461896', enigma.generate_key
	end

	def test_todays_date
		skip
		enigma = Enigma.new

		assert_equal '180121', enigma.todays_date
	end
end
