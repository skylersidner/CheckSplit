require 'pry'
require_relative 'DinnerClub'

puts "Welcome to the DinnerClub Driver!"
puts "What would you like to do?"
puts "1. Document a check to split"
puts "2. Create a new Dinner Club"
puts "3. Run a default demo"
puts "0. Exit"

choice = gets.chomp.to_i

case choice
when 1
  puts "You've chosen to document a check, so we can split it up."
  puts "Please enter the total of the bill, including tax (e.g.: 42.42): "
  total = gets.chomp.to_f
  
  puts "Please enter the percentage you would like to tip (e.g.: 17): "
  tip = gets.chomp.to_i
  
  puts "Please enter the number of guests to split the check (e.g.: 3): "
  num = gets.chomp.to_i
  
  check = CheckSplitter.new(total, tip, num)
  
  puts "#{tip}\% of $#{total} would be $#{check.tip}.  That brings the total to $#{check.total_cost}."
  puts "Split among #{num} people, that would be $#{check.per_person} per person."
  
when 2
  puts "This is a work in progress."
  
when 3
  puts "This is a work in progress."
  
else
end


# # Test statement
# check = CheckSplitter.new(42.42, 17, 3)
# puts check.tip
# puts check.total_cost
# puts check.per_person
#
# club = DinnerClub.new("Club Dragon", "Bob", "Sue", "Joe", "Ian", "Sam")
#
#
# club.dinner_event("Blue Sushi", 83.71, 18, "Bob", "Sue", "Ian", "Sam", "Daisy-Mae")
# @members
# @member_totals

