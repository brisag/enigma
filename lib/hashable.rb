module Hashable
  def create_return_hash(message, incoming_text)
    return_hash = {}
    return_hash[(incoming_text).to_sym] = message
    return_hash[:key] = key
    return_hash[:date] = date
    return_hash
  end
end
