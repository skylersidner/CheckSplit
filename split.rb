# Used so we can halt and interact with the program
require 'pry'

# Class: Split
#
# Creates a check that needs to be split up for payment
#
# Attributes:
# @cost     - Float: Cost of the bill, as presented to the guests
# @percent  - Float: Percentage the guests wish to tip
# @guests   - Integer: Quantity of guests splitting the check
#
# Methods:
# #cost
# #cost=
# #percent
# #percent=
# #guests
# #guests=
# #per_person


class Split
  #EXAMPLE!!!!!!!!
  # Public: #play
  # Starts and then plays the game with the provided players.
  #
  # Parameters:
  # player1 - Player: One of the players.
  # player2 - Player: Another player.
  # player3 - Player: This isn't a real parameter for this method, but it's here to demonstrate
  #           how you would type a very long description of a parameter.
  #
  # Returns:
  # Player: Whoever was victorious.
  #
  # State Changes:
  # Sets @winning_player and @losing_player.



  # Public: @attr_accessor
  # Creates get/set methods for #cost, #percent, #guests
  # 
  # Parameters:
  # 
  # Returns:
  #
  # State Changes:
  #
  attr_accessor :cost, :percent, :guests
  
  # Public: #initialize
  # Setup for creating new String Class objects
  # 
  # Parameters:
  # cost    - Float: Cost of the bill, as presented to the guests
  # percent - Float: Percentage the guests wish to tip
  # guests  - Integer: Quantity of guests splitting the check
  #
  # Returns:
  # @cost, @percent, @guests, as entered
  #
  # State Changes:
  # @cost, @percent, @guests are each now instance variables with values
  
  def initialize(cost, percent, guests)
    @cost = cost
    @percent = percent
    @guests = guests
  end
  
  # Public: 
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  # State Changes:
  #
  
  def tip
    @cost * (@percent.to_f / 100)
  end

  # Public: 
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  # State Changes:
  #
  
  def total_cost
    @cost + tip
  end

  # Public: 
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  # State Changes:
  #

  def per_person
    total_cost / @guests
  end
end

# New class to interact with Split
class DinnerClub
  def initialize(club_name)
    @club_name = club_name
    @members = {}
  end
  
  def new_member(name)
    @members[name] = 0.0
  end
  
  def list_members
    @members
  end
  
  def members_present
    @members.count
  end
  
  # Method to create a new split check
  def new_dinner(cost, percent)
    guests = members_present
    @check = Split.new(cost, percent, guests)
  end
  
  def cost_to_members
    @check.per_person.round(2)
  end
  
  # Adds to each member's total
  def charge_em
    @members.each { |key, value|
      @members[key] = value += cost_to_members
    }
  end
end


    
# Halting command
binding.pry