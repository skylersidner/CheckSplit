require 'minitest/autorun'
require_relative 'split.rb'

class SplitCheckTest < Minitest::Test
  
  def test_if_percent_is_dividing_correctly
    sc = SplitCheck.new(10.00, 10, 2)
    assert_equal 1.00, sc.tip
  end
  
  def test_if_total_cost_is_adding_correctly
    sc = SplitCheck.new(10.00, 10, 2)
    assert_equal 11.00, sc.total_cost
  end
  
  def test_if_per_person_is_rounding_correctly
    sc = SplitCheck.new(10.03, 10, 2)
    assert_equal 5.52, sc.per_person
  end
end
