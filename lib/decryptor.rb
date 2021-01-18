class Decryptor
  attr_reader :key,
              :date,
              :message,
              :decoded_message,
              :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @decoded_message = []
    @alphabet = ("a".."z").to_a << " "
  end

  def get_shifts
    test_key = Key.new(key)
    test_offset = Offset.new(date)
    shift = Shift.new(test_key, test_offset)

    test_key.create_keys
    test_offset.create_offset
    shift.generate
  end

  def index_start
    message.downcase.split("").map do |letter|
      alphabet.find_index(letter)
    end
  end

  def decode(index_array, shifts)
    decoded_message = []
    index_array.each.with_index do |character, index|
      if character == nil
        decoded_message << message[index]
        next
      end
      generate = character - shifts[index%4]
      decoded_message << alphabet.rotate(generate)[0]
    end
    decoded_message.join
  end

  def generate_decoded_message
    index_array = index_start
    shifts = get_shifts
		create_return_hash(decode(index_array, shifts))
	end

  def create_return_hash(ciphertext)
    return_hash = {}
    return_hash[:decryption] = ciphertext
    return_hash[:date] = date
    return_hash[:key] = key
    return_hash
  end
end
