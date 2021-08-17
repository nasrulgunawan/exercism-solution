=begin
Write your code for the 'List Ops' exercise in this file. Make the tests in
`list_ops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/list-ops` directory.
=end

class ListOps
  class << self
    def arrays(arr)
      # arr.size

      map(0, arr) { |acc, _x| acc + 1 }
    end

    def reverser(arr)
      map(arr) { |acc, x| acc.unshift(x) }
    end

    def concatter(first, second)
      map(first, second) { |_acc, x| first << x }
    end

    def mapper(arr, &block)
      map(arr) { |acc, x| acc << block[x] }
    end

    def filterer(arr, &block)
      map(arr) { |acc, x| block[x] ? acc << x : acc }
    end

    def sum_reducer(arr)
      map(0, arr) { |acc, x| acc + x }
    end

    def factorial_reducer(arr)
      map(1, arr) { |acc, x| acc * x }
    end

    private

    def map(acc = [], arr, &block)
      arr.each do |x|
        acc = yield(acc, x)
      end

      acc
    end
  end
end