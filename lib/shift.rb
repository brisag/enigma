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
end 
