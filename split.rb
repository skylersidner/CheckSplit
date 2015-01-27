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