class Enigma
	attr_reader :message,
							:key,
							:date,
							:alphabet,
							:encoded_message

 def initialize(message, key = Key.new, date = Offset.new)
		@message = message.downcase.split("")
		@key = key
    @date = date
    @alphabet = []
		@encoded_message = []
  end

	def create_alphabet
    @alphabet << (("a".."z").to_a << " ")
    @alphabet.flatten!
  end

end
