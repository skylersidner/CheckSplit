# Used so we can halt and interact with the program
require 'pry'

class Split
  # Enables get/set for each of these method calls
  attr_accessor :cost, :percent, :guests
  
  # Deamnds parameters, instance variable declaration and initial operations
  def initialize(cost, percent, guests)
    @cost = cost
    @percent = (percent.to_f / 100)
    @guests = guests
    @tip = (@cost * @percent)
    @total_cost = (@cost + (@tip))
  end

  # Methods to call specifics of operations
  def tip
    perc = (@percent * 100)
    @cost * @percent
  end

  def total_cost
    @cost + tip
  end
  
  # Solution
  def per_person
    total_cost / @guests
  end
end

# Halting command
binding.pry