class Router
  def initialize(controller)
    @controller = controller
    @running = true
  end

  def run
    puts "Welcome to this foreign exchange converter!"
    puts "                 ---                       "

    while @running
      display_tasks
      action = gets.chomp.to_i
      # display the sub tasks of each task ()
      # display_subtasks(action)
      # no need of the display_subtask method, all fo this will happen in the view
      print `clear`
      # Here, depending on the hash returned  by display subtasks, I will route
      # toward the right action within the controller
      route_action(action)
    end

  end

  def route_action(action)
    case action
    when 1 then @controller.display_result
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then stop
    else
      puts "Please press 1, 2, 3 or 4"
    end
  end

  def stop
    @running = false
  end


  def display_tasks
    # Will display here the different actions possible for the user
    puts ""
    puts "What do you want to do next?"
    puts "1 - Get the FX rate of a base currency into several target currencies"
    puts "2 - Convert a given value in a base currency into several target currencies"
    puts "3 - Get the best exchange rate of a base currency into a target currency at a specific date"
    puts "4 - Stop and exit the program"
  end

  def display_subtasks(action)
    hash = {}
    hash[:target_currencies] = []
    if action == 1
      puts "a. What is the base currency?"
      display_currencies
      hash[:base_currency] = gets.chomp.to_i
      while gets.chomp.to_i > 0
        puts "b. What are the target currencies?"
        display_currencies # there will need to be a specific method or an argument to the method here to display the I'm done option
        hash[:target_currencies] << gets.chomp.to_i
      end
      puts "c. For which date do you want the exchange rate?"
      hash[:date] = gets.chomp
    elsif action == 2
      puts "a. Which value do you want to convert?"
      hash[:value_to_convert] = gets.chomp.to_f
      puts "a. What is the base currency?"
      display_currencies
      hash[:base_currency] = gets.chomp.to_i
      while gets.chomp.to_i > 0
        puts "b. What are the target currencies?"
        display_currencies # there will need to be a specific method or an argument to the method here to display the I'm done option
        hash[:target_currencies] << gets.chomp.to_i
      end
      puts "c. For which date do you want the exchange rate?"
      hash[:date] = gets.chomp
    elsif action == 3
      puts "a. What is the base currency?"
      display_currencies
      hash[:base_currency] = gets.chomp.to_i
      puts "b. What is the target currency?"
      display_currencies
      hash[:target_currency] = gets.chomp.to_i
    end
    return hash
  end



end
