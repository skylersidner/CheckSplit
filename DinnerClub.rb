require 'pry'
require_relative 'CheckSplitter'
require 'sqlite3'

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
    end #.each
    @event_log = Hash.new
    # DATABASE = SQLite3::Database.new("#{name}data.db")
    # DATABASE.results_as_hash = true
  end #method
  
  # Public: #new_member
  # 
  # Adds a new member, by name, to the @members array
  # 
  # Parameters:
  # name - String: Name of the new member to be added.
  # 
  # Returns:
  # The new member's hash assignment in @member_totals (with a 0.0 value).
  #
  # State Changes:
  # Pushes a new value to @members; assigns a new key-value pair to @member_totals
  
  def new_member(name)
    @members << name
    @member_totals[name] = 0.0
  end
  
  # Private: #update_totals
  # 
  # Used to increment the amount each member has spent
  #
  # Parameters:
  # name    - String: The name of the member (hash key)
  # amount  - Float: The amount to added to their total balance (hash value)
  #
  # Returns:
  # New value for that member's hash key in @member_totals
  #
  # State Changes:
  # Increments the @member_totals value for the corresponding hash
  
  def update_totals(name, amount)
    @member_totals[name] += amount
    @member_totals[name]
  end
    
  # Public: #dinner_event
  #
  # Creates a new SplitCheck object as a dinner event.
  # 
  # Parameters:
  # name    - String: Name of the event
  # cost    - Float: Cost of the bill, pre-tip
  # percent - Integer: Tip percentage
  # guests  - String list: Each guest, by name, attending the event
  # 
  # Returns:
  # @check, the new CheckSplitter instance
  #
  # State Changes:
  # @event stores the event name; @who_attended stores an array of the attending people;
  # @check becomes a new SplitCheck object;
  
  def dinner_event(name, cost, percent, *guests)
    @event = name
    @who_attended = guests
    @check = CheckSplitter.new(cost, percent, @who_attended.length)
  end
  
  # Public: #log_event
  #
  # Determines the cost per attending person, adds that to their total, and logs the event;
  # people present at the event, but not part of the DinnerClub are added to the list.
  # 
  # Parameters: None
  #
  # Returns:
  # An array of all those attending
  #
  # State Changes:
  # @member_totals is updated for each person attending, including new members; @event_log is
  # updated with a list of those who attended that specific event.
  
  def log_event
    @who_attended.each do |name|
      if @member_totals.has_key?(name)
        update_totals(name, @check.per_person)
      else
        new_member(name)
        update_totals(name, @check.per_person)
      end #if
    @event_log[@event] = @who_attended
    end #.each
  end #method
  
  # Public: #log_event_treat
  #
  # When one member is paying, you apply this method to charge them and log the event.
  # 
  # Parameters:
  # name - String: Name of the person treating for this event
  #
  # Returns:
  # 
  #
  # State Changes:
  # @member_totals is updated for the person treating; only creates a new member if they are
  # the person treating; @event_log is updated with a list of those who attended that specific
  # event.
  
  def log_event_treat(name)
    if @member_totals.has_key?(name)
      update_totals(name, @check.total_cost.round(2))
    else
      new_member(name)
      update_totals(name, @check.total_cost.round(2))
    end #if
    @event_log[@event] = @who_attended
  end #method
  
end #class