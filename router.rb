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
    puts ""
    puts "What do you want to do next?"
    puts "1 - Get the FX rate of a base currency into several target currencies"
    puts "2 - Convert a given value in a base currency into several target currencies"
    puts "3 - Get the best exchange rate of a base currency into a target currency at a specific date"
    puts "4 - Stop and exit the program"
  end
end
