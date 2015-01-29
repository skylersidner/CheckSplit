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
  
  # Private: #initialize
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
    @cost * (@percent.to_f / 100)
  end

  # Private: #total_cost 
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

  # Private: #per_person
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

class DinnerClub
  
  attr_accessor :name
  attr_reader :members, :member_totals, :event_log, :event, :who_attended, :check
  
  def initialize(name, *joining)
    @name = name
    @members = Array.new
    @member_totals = Hash.new
    x = joining
    x.each do |person|
      new_member(person)
    end
    @event_log = Hash.new
  end
  
  # Public: #new_member
  # 
  # Adds a new member, by name, to the @members array
  # 
  # Parameters:
  # name - String: Name of the new member to be added.
  # 
  # Returns:
  # The new member's name and base spent value of 0.0
  #
  # State Changes:
  # Pushes a new value to @members; assigns a new key-value pair to @member_totals
  
  def new_member(name)
    @members << name
    @member_totals[name] = 0.0
  end
  
  # Private: #
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  #
  # State Changes:
  #
  
  def update_totals(name, amount)
    @member_totals[name] += amount
  end
  
  # Private: #
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  #
  # State Changes:
  #
  
  def update_event_log(location, diners)
    @event_log[location] = diners
  end
    
  # Private: #
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  #
  # State Changes:
  #
  
  def dinner_event(name, cost, percent, *guests)
    @event = name
    @who_attended = guests
    @check = SplitCheck.new(cost, percent, @who_attended.length)
  end
  
  # Private: #
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  #
  # State Changes:
  #
  
  def log_event
    @who_attended.each do |name|
      if @member_totals.has_key?(name)
        update_totals(name, @check.per_person)
      else
        new_member(name)
        update_totals(name, @check.per_person)
      end
    @event_log[@event] = @who_attended
    end
  end
  
  # Private: #
  # 
  # 
  # Parameters:
  # 
  # Returns:
  #
  #
  # State Changes:
  #
  
  def log_event_treat(name)
    if @member_totals.has_key?(name)
      update_totals(name, @check.total_cost.round(2))
    else
      new_member(name)
      update_totals(name, @check.total_cost.round(2))
    end
    @event_log[@event] = @who_attended
  end
    
  
end




# Test statement
check = SplitCheck.new(42.42, 17, 3)
puts check.tip
puts check.total_cost
puts check.per_person

club = DinnerClub.new("Club Dragon", "Bob", "Sue", "Joe", "Ian", "Sam")
# club.new_member("Bob")
# club.new_member("Sue")
# club.new_member("Joe")
# club.new_member("Ian")
# club.new_member("Sam")
# club.list_members
# club.list_totals

club.dinner_event("Blue Sushi", 83.71, 18, "Bob", "Sue", "Ian", "Sam", "Daisy-Mae")
@members
@member_totals

# Halting command
binding.pry