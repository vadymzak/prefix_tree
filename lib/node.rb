class Node
  attr_reader   :next
  attr_accessor :route, :value

  def initialize(value)
    @value = value
    @route = false
    @next  = []
  end

  def validate_value?(word)
    return true if value.start_with? ':'

    value == word
  end
end
