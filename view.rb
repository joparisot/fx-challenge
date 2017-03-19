require_relative 'parsing'

class View
  def initialize(twilio_client, number_hash)
    @twilio_client = twilio_client
    @from_number = number_hash[:from_number]
    @to_number = number_hash[:to_number]
  end

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
    @twilio_client.account.messages.create(
      from: @from_number,
      to: @to_number,
      body: "#{hash}"
    )
  end

  def display_currencies(currencies)
    currencies.each_with_index do |currency|
      puts "#{currency}"
    end
  end
end
