class Enigma
	def initialize()
	end

  def encrypt(message, key = generate_key, date = todays_date)
		encryptor = Encryptor.new(message, key, date)
		encryptor.generate_encoded_message
	end

	def decrypt(message, key = generate_key, date = todays_date)
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
