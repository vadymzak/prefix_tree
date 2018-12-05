class Tree
  def initialize
    @root = Node.new('*')
  end

  def add_route(route)
    words = route.split('/')
    base = @root
    words.each{ |word| base = add_word(word, base.next) }
    base.route = true
  end

  def add_word(word, tree)
    tree.find{ |n| n.value == word } || add_node(word, tree)
  end

  def add_node(word, tree)
    Node.new(word).tap { |new_node| tree << new_node }
  end

  def find_route(route)
    words = route.split('/')
    base  = @root
    word_found =
      words.all? { |word| base = find_word(word, base.next) }
    yield word_found, base if block_given?
    base
  end

  def find_word(word, tree)
    tree.find { |n| n.value == word }
  end

  def include?(route)
    find_route(route) { |found, base| return found && base.route }
  end
end
