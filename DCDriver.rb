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
  puts "Please enter the total of the bill, including tax (e.g.: 83.71): "
  total = gets.chomp.to_f
  
  puts "Please enter the percentage you would like to tip (e.g.: 18): "
  tip = gets.chomp.to_i
  
  puts "Please enter the number of guests to split the check (e.g.: 3): "
  num = gets.chomp.to_i
  
  check = CheckSplitter.new(total, tip, num)
  
  puts "#{tip}\% of $#{total} would be $#{check.tip}.  That brings the total to $#{check.total_cost}."
  puts "Split among #{num} people, that would be $#{check.per_person} per person."
  
when 2
  puts "This is a work in progress."
  
when 3
  demo_check = CheckSplitter.new(83.71, 18, 5)
  club = DinnerClub.new("Club Dragon", "Bob", "Sue", "Joe", "Ian", "Sam")
  club.dinner_event("Blue Sushi", 83.71, 18, "Bob", "Sue", "Ian", "Sam", "Daisy-Mae")
  puts "For the purposes of this demo, we are creating a new Dinner Club, called \"Club Dragon\"  The members include Bob, Sue, Joe, Ian, and Sam.  Currently, the amounts spent by the members are: "
  
  club.member_totals.each_pair do |key, value|
    if value == 0.0
      puts "#{key}.....$0.00"
    else
      puts "#{key}.....$#{value.round(2)}"
    end #if
  end #each
  
  puts "Some of the Club Dragon members are attending Blue Sushi; they include Bob, Sue, Ian, Sam, and Sam's friend, Daisy-Mae."
  puts "The total of the check was $#{demo_check.cost} and they intend to tip #{demo_check.percent}%.  That means the total with tip is $#{demo_check.total_cost} and the cost per person is $#{demo_check.per_person}.  Since Daisy-Mae is out on this venture, she will be added to the Club Dragon roster!"
  
  club.log_event
  
  puts "The new amounts spent by the Club Dragon members are: "
  
  club.member_totals.each_pair do |key, value|
    if value == 0.0
      puts "#{key}.....$0.00"
    else
      puts "#{key}.....$#{value.round(2)}"
    end #if
  end #each
  
else
end #case



