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


class SplitCheck
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
    (total_cost / @guests).round(2)
  end
end

# New class to interact with Split
class DinnerClub
  def initialize(name)
    @name = name
    @members = []
    @member_totals = {}
  end
  
  def new_member(name)
    @members << name
    @member_totals[name] = 0.0
  end
  
  # @members.each { |key|
  #   @member_totals[key] = 0.0
  # }
    

  # Mostly for testing
  def list_members
    @members
  end
  
  # Mostly for testing
  def list_totals
    @member_totals
  end
  
  def members_present
    @members.count
  end
end


class DinnerEvent
  def initialize(name, cost, percent, guests)
    @event = name
    @check = SplitCheck.new(cost, percent, guests)
    @event_log = {}
    @event_log[name] = ""
    @who_attended = []
  end
  
  def attended(x)
      @who_attended << x
  end
  
  def cost_to_attending
    @check.per_person
  end
  
  
  # Adds to each member's total
  # WARNING - THIS CURRENTLY IS NOT WORKING - 1-27-2015
  def log_event
    @who_attended.each { |name|
      x = @member_totals[name]
      @member_totals[name] = (x += cost_to_attending)
    }
    @event_log[@event] = @who_attended
  end
end




# Test statement
check = SplitCheck.new(42.42, 17, 3)
puts check.tip
puts check.total_cost
puts check.per_person

club = DinnerClub.new("Club Dragon")
club.new_member("Bob")
club.new_member("Sue")
club.new_member("Joe")
club.new_member("Ian")
club.new_member("Sam")
club.list_members
club.list_totals

event = DinnerEvent.new("Blue Sushi", 83.71, 18, 4)
event.attended("Bob")
event.attended("Sue")
event.attended("Ian")
event.attended("Sam")


# Halting command
binding.pry