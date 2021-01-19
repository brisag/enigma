class Enigma
	attr_reader :message,
							:key,
							:date,
							:alphabet,
							:encoded_message

	def initialize()
	end

  def encrypt(message, key = Key.new, date = Offset.new)
		encryptor = Encryptor.new(message, key, date)
		encryptor.generate_encoded_message
	end

	def decrypt(message, key = Key.new, date = Offset.new)
		decryptor = Decryptor.new(message, key, date)
		decryptor.generate_decoded_message
	end

  def generate_key
    rand(1000000).to_s.rjust(5,'0')
  end

	def todays_date
		Date.today.strftime("%d%m%y")
	end
end

#   def build_encrypt(message, key, date)
#     encryption_hash = {encryption: message,
# 									      key: key,
# 									      date: date}
#     encryption_hash
#   end
#
#   def encrypt(message, key = generate_key, date = todays_date)
#     build_encrypt(message, key, date)
#   end
# #
# # 	def build_decrypt(message, key, date)
# 		encryption_hash = {decryption: message,
# 												key: key,
# 												date: date}
# 		decryption_hash
# 	end
#
# 	def encrypt(message, key = nil, date = nil)
# 		build_encrypt(message, key || decryption.random_number_generator, date || decryptio.todays_date_generator)
# 	end
# end
