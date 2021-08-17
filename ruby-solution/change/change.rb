=begin
Write your code for the 'Change' exercise in this file. Make the tests in
`change_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/change` directory.
=end

class Change
  class << self
    def generate(coins, change)
      return [] if change.zero?
      raise Change::NegativeTargetError if change.negative?
      raise Change::ImpossibleCombinationError if change < coins.min
      
      result = []
      filtered_coins = filter(coins, change)
      max_coin = (change / filtered_coins.min).ceil

      (1..max_coin).each do |coin|
        filtered_coins.repeated_combination(coin) do |combo_coins|
          return combo_coins.sort if matched?(combo_coins, change)
        end
      end

      raise Change::ImpossibleCombinationError if result.empty?
    end

    private
    
    def filter(coins, change)
      coins.select { |coin| coin <= change }.sort.reverse
    end

    def matched?(combo_coins, change)
      combo_coins.reduce(0, :+) === change
    end
  end

  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end
end