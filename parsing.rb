require 'open-uri'
require 'json'

def parsing_all_currencies(currencylayer_key)
  url = "http://apilayer.net/api/list?access_key=#{currencylayer_key}&prettyprint=1"
  hash = JSON.parse(open(url).read)
  hash['currencies']
end

def parsing_fx(hash, currencylayer_key)
  target_currencies_string = ""
  hash[:target_currencies].each {|currency| target_currencies_string += ",#{currency}"}
  url = "http://apilayer.net/api/live?access_key=#{currencylayer_key}&currencies=#{target_currencies_string}&source=#{hash[:base_currency]}&date=#{hash[:date]}&format=1"
  result_hash = JSON.parse(open(url).read)
  result_hash['quotes']
end
