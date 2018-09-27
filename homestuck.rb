module Homestuck
  module_function

  def save!(msg)
    markov = MarkyMarkov::Dictionary.new("dicts/#{msg.char_name}")
    markov.parse_string(msg.text)
    markov.save_dictionary!
  end
end