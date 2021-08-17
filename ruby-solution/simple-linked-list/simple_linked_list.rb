=begin
Write your code for the 'Simple Linked List' exercise in this file. Make the tests in
`simple_linked_list_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/simple-linked-list` directory.
=end

class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum)
    @datum = datum
  end
end

class SimpleLinkedList
  def initialize(arr = [])
    @head = nil
    
    arr.each do |element|
      push(Element.new(element))
    end
  end

  def push(element)
    element.next = @head
    @head = element
    self
  end

  def pop
    return unless @head
    
    element = @head
    @head = element.next
    element
  end

  def to_a
    current_elements.map(&:datum)
  end

  def reverse!
    elements = current_elements
    @head = nil
    elements.each { |element| push(element) }
    self
  end

  private

  def current_elements
    return [] unless @head

    element = @head
    
    result = []
    while element do
      result << element
      element = element.next
    end

    result
  end
end