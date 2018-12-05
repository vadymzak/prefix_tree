class Node
  attr_reader   :next
  attr_accessor :route, :value

  def initialize(value)
    @value = value
    @route = false
    @next  = []
  end
end
