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

	def test_it_can_encode

		new_enigma = Enigma.new
		#new_enigma.encrypt('hello world!', '02715", "040895")
	  expected = {:encryption=>'keder ohulw!', :date=>'040895', :key=>'02715'}
		assert_equal expected, new_enigma.encrypt('hello world!', '02715', '040895')
	  expected = {:encryption=>'hxda', :date=>'190420', :key=>'01824'}
		assert_equal expected, new_enigma.encrypt('abcd', '01824', '190420')
	end

	def test_it_encodes_single_characters
		new_enigma = Enigma.new
	  expected = {:encryption=>'d', :date=>'040895', :key=>'02715'}
		assert_equal expected, new_enigma.encrypt('A', '02715', '040895')
	end

	def test_it_can_decrypt_with_key_and_date

		enigma = Enigma.new
	  expected = {:decryption=>'hello world', :date=>'040895', :key=>'02715'}
		assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')
	end

	def test_it_can_decrypt_a_message_using_todays_date
		Date.stubs(:strftime).returns(Date.new(2021,1,18))
	  enigma = Enigma.new
	  encrypted = enigma.encrypt('hello world', '02715')
	  expected = {:decryption=>'hello world', :date=>'180121', :key=>'02715'}
	  assert_equal expected, enigma.decrypt(encrypted[:encryption], '02715')
	end

	def test_it_can_encrypt
	  enigma = Enigma.new
	  expected = {encryption: 'vjqtbeaweqihssi', key: '08304', date: '291018'}
	  assert_equal expected, enigma.encrypt('hello world end', '08304', '291018')
	end

	def test_encrypt_a_message_with_a_key_using_todays_date
	  Date.stubs(:today).returns(Date.new(1995,8,4))
	  enigma = Enigma.new
	  expected = ({:encryption=>'keder ohulw', :date=>'040895', :key=>'02715'})
	  assert_equal expected, enigma.encrypt('hello world', '02715')
	end

	def test_encrypt_a_message_with_a_message_and_no_key_or_date
	  Date.stubs(:today).returns(Date.new(1995,8,4))
	  enigma = Enigma.new
	  enigma.stubs(:generate_random_key).returns('02715')
	  expected = ({:encryption=>'keder ohulw', :date=>'040895', :key=>'02715'})
	  assert_equal expected, enigma.encrypt('hello world')
	end

	def test_it_can_encrypt_message_with_characters_outside_set
		new_enigma = Enigma.new
		expected = {:encryption=>'!@', :date=>'040895', :key=>'02715'}
		assert_equal expected, new_enigma.encrypt('!@', '02715', '040895')
	end

	def test_it_can_crack_an_encryption_with_a_date
	  skip
	  enigma = Enigma.new
	  expected = {decryption: 'hello world end',date: '291018',key: '08304'}
	  assert_equal expected, enigma.crack('vjqtbeaweqihssi', '291018')
	end
end


# 	def test_it_exists
# 		enigma = Enigma.new
# 		assert_instance_of Enigma, enigma
# 	end
#
#   def test_it_can_encrypt_message_with_a_key_and_message
#     enigma = Enigma.new
#     expected = {
#                   encryption: 'keder ohulw',
#                   key:        '02715',
#                   date:       '040895'
#                }
#
#     assert_equal expected, enigma.encrypt('hello world', '02715', '040895')
#   end
#
#   def test_it_can_decrypt_message_with_a_key_and_message
# 		skip
#     enigma = Enigma.new
#     expected = {
#                   decryption: 'hello world',
#                   key:        '02715',
#                   date:       '040895'
#                }
#
#     assert_equal expected, enigma.decrypt('keder ohulw', '02715', '040895')
#
