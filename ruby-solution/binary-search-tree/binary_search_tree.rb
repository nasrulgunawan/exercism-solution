=begin
Write your code for the 'Binary Search Tree' exercise in this file. Make the tests in
`binary_search_tree_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/binary-search-tree` directory.
=end

class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(num)
    num > data ? insert_to(:right, num) : insert_to(:left, num)
  end

  def each(&block)
    return enum_for(:each) unless block_given?

    left.each(&block) if left
    yield(data)
    right.each(&block) if right
  end

  private

  def insert_to(position, num)
    func_position = send(position)

    if func_position
      func_position.insert(num)
    else
      self.instance_variable_set("@#{position}", Bst.new(num))
    end
  end
end