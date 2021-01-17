class Shift
  attr_reader :key,
              :offset,
              :a_shift,
              :b_shift,
              :c_shift,
              :d_shift,
              :shifts

  def initialize(key, offset)
    @key = key
    @offset = offset
    @shifts = []
  end

  def generate
    @shifts << @key.a_key + @offset.a_offset
    @shifts << @key.b_key + @offset.b_offset
    @shifts << @key.c_key + @offset.c_offset
    @shifts << @key.d_key + @offset.d_offset
  end
end
