require 'pry'

class Checksplitter
  def initialize(par1)
    @check = par1
    @percent = 15.0
    @group_num = 1
    @tip = 0
    @tip = 0
  end

  def set_group_num(x)
    @group_num = x
  end
  
  def get_group_num
    @group_num
  end
  
  def set_percent(x)
    @percent = x
  end
  
  def get_percent
    @percent
  end
  
  def set_check(x)
    @check = x
  end
  
  def get_check
    @check
  end
  
  def get_tip
    @tip = (@check * (@percent / 100))
  end
  
  def get_total
    @total = (@check + @tip)
  end
  
  def get_per_person
    @per_person = (@total / @groupnum)
    puts "Split evenly, each person owes $#{@per_person}."
  end
end

binding.pry