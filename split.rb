require 'pry'

class Split
  attr_accessor :cost, :percent, :guests
  
  def initialize(cost, percent, guests)
    @cost = cost
    @percent = (percent.to_f / 100)
    @guests = guests
    @tip = (@cost * @percent)
    @total_cost = (@cost + (@tip))
  end

  def tip
    perc = (@percent * 100)
    puts "The tip at #{perc} percent would be $%.2f." % @tip
  end

  def total_cost
    puts "The total cost, with tip, would be $%.2f." % @total_cost
  end
  
  def per_person
    puts "Split evenly, the cost per person would be $%.2f." % (@total_cost / @guests)
  end
end

binding.pry