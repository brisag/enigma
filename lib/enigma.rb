class Enigma
	attr_reader :message,
							:key,
							:date,
							:alphabet,
							:encoded_message

  def initialize
    @encryptor = Encryptor.new
    # @decryptor = Decryptor.new
  end

	def create_alphabet
	  @alphabet << (("a".."z").to_a << " ")
	  @alphabet.flatten!
	end

  def build_encrypt(message, key, date)
    encryption_hash = {
									      encryption: message,
									      key: key,
									      date: date
									    }
    encryption_hash
  end

  def encrypt(message, key = nil, date = nil)
    build_encrypt(message, key || @encryptor.random_number_generator, date || @encryptor.todays_date_generator)
  end

	# def build_decrypt(message, key, date)
	# 	encryption_hash = {
	# 											decryption: message,
	# 											key: key,
	# 											date: date
	# 										}
	# 	decryption_hash
	# end
	#
	# def encrypt(message, key = nil, date = nil)
	# 	build_encrypt(message, key || decryption.random_number_generator, date || decryptio.todays_date_generator)
	# end
end
