
require 'open-uri'
require 'json'
require 'pry-byebug'

def parsing_all_currencies
  url = 'http://apilayer.net/api/list?access_key=18bde25409ab8a0d2edecaee47a116c7&prettyprint=1'
  hash = JSON.parse(open(url).read)
  hash['currencies']
end

def parsing_fx(hash)
  target_currencies_string = ""
  hash[:target_currencies].each {|currency| target_currencies_string += ",#{currency}"}
  url = "http://apilayer.net/api/live?access_key=18bde25409ab8a0d2edecaee47a116c7&currencies=#{target_currencies_string}&source=#{hash[:base_currency]}&date=#{hash[:date]}&format=1"
  binding.pry
  result_hash = JSON.parse(open(url).read)
  result_hash['quotes']
end


# hash = {
# date: '2000-03-11',
# target_currencies: ['AUD','CHF','EUR','GBP','PLN'],
# base_currency: 'USD'}


# p parsing_fx(hash)
