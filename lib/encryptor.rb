class Encryptor
  attr_reader :key,
              :date,
              :message,
              :encoded_message,
              :alphabet

  def initialize(message, key, date)
    @message = message
    @key = key
    @date = date
    @encoded_message = []
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

  def generate_encoded_message
    index_array = index_start
    shifts = get_shifts
    create_return_hash(encode(index_array, shifts))
  end

  def encode(index_array, shifts)
    encoded_message = []
    index_array.each.with_index do |character, index|
      if character == nil
        encoded_message << message[index]
        next
      end
      offs = character + shifts[index%4]
      encoded_message << alphabet.rotate(offs).first
    end
    encoded_message.join
  end

  def create_return_hash(encrypted_string)
    return_hash = {}
    return_hash[:encryption] = encrypted_string
    return_hash[:key] = key
    return_hash[:date] = date
    return_hash
  end
end
