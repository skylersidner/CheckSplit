require 'pry'

# Class: CheckSplitter
#
# Creates a check that needs to be split up for payment
#
# Attributes:
# @cost     - Float: Cost of the bill, as presented to the guests
# @percent  - Float: Percentage the guests wish to tip
# @guests   - Integer: Quantity of guests splitting the check
#
# Methods:
# #cost, #cost=
# #percent, #percent=
# #guests, #guests=

class CheckSplitter

  attr_accessor :cost, :percent, :guests
  
  # Private: #initialize
  # Setup for creating new String Class objects
  # 
  # Parameters:
  # cost    - Float: Cost of the bill, as presented to the guests
  # percent - Float: Percentage the guests wish to tip
  # guests  - Integer: Quantity of guests splitting the check
  #
  # Returns:
  # A new CheckSplitter object.
  #
  # State Changes:
  # @cost, @percent, @guests are each now instance variables with values
  
  def initialize(cost, percent, guests)
    @cost = cost
    @percent = percent
    @guests = guests
  end
  
  # Private: #tip
  # Calculates the tip based on cost and percentage
  # 
  # Parameters: None
  # 
  # Returns:
  # An unrounded float representing the tip to the server
  #
  # State Changes: None
  
  def tip
    (@cost * (@percent.to_f / 100)).round(2)
  end

  # Public: #total_cost 
  # Calculates the total cost to be split among the guests
  # 
  # Parameters: None
  # 
  # Returns:
  # An unrounded float representing the total cost of the check, including tip
  #
  # State Changes: None
  
  def total_cost
    @cost + tip
  end

  # Public: #per_person
  # 
  # 
  # Parameters: None
  # 
  # Returns:
  # A rounded float representing the cost of the check per person
  #
  # State Changes: None
  #

  def per_person
    (total_cost / @guests).round(2)
  end
end
