class Key
  attr_reader :key,
              :a_key,
              :b_key,
              :c_key,
              :d_key
  def initialize(key)
    @key   = key
    @a_key = 0
    @b_key = 0
    @c_key = 0
    @d_key = 0
  end
