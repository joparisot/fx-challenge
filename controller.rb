require_relative 'view'

class Controller
  def initialize(twilio_client, currencylayer_key, number_hash)
    @twilio_client = twilio_client
    @currencylayer_key = currencylayer_key
    @number_hash = number_hash
    @view = View.new(@twilio_client, @number_hash)
  end

  def display_result
    all_currencies = parsing_all_currencies(@currencylayer_key)
    hash = @view.prompt_fx(all_currencies)
    result_hash = parsing_fx(hash, @currencylayer_key)
    @view.display_result(result_hash)
  end
end
