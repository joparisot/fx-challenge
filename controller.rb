require_relative 'view'

class Controller
  def initialize
    @view = View.new
  end

  def display_result
    all_currencies = parsing_all_currencies
    hash = @view.prompt_fx(all_currencies)
    result_hash = parsing_fx(hash)
    @view.display_result(result_hash)
  end


end
