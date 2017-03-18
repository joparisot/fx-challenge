require_relative 'parsing'

# +33644640723
class View
  def prompt_fx(currencies)
    hash = {}
    hash[:target_currencies] = []
    puts "a. What is the base currency?"
    display_currencies(currencies)
    hash[:base_currency] = gets.chomp
    i = 1
    while !(i == '0')
      puts "b. What are the target currencies?"
      puts "0. I'm done selecting currencies"
      display_currencies(currencies)
      i = gets.chomp
      hash[:target_currencies] << i unless i == '0'
    end
    puts "c. For which date do you want the exchange rate? Please use the format YYYY-MM-DD"
    hash[:date] = gets.chomp
    return hash
  end

  def display_result(hash)
    puts "Those are the results: "
    p hash
  end

  def display_currencies(currencies)
    # key: 18bde25409ab8a0d2edecaee47a116c7
    # for all currencies, i can parse
    # Will display here all the different currencies that can be converted
    # When we ask several currencies, we will have to display a first / last option "I'm done": let's use 0
    currencies.each_with_index do |currency|
      puts "#{currency}"
    end
  end

end
