module Homestuck
  module_function

  CHAR_REGEX = /^[\w]+: /

  def read(log)
    text = log.to_s
    
    char = log.match(CHAR_REGEX).to_s
    text = log.gsub(char, '')

    [char, text]
  end  

  def file_for(char)
    char = char.gsub(': ', '').downcase.to_sym
    char = CHARS.detect do |key, value|
      key.include?(char)
    end&.last
  end

  def save!(filename, text)
    markov = MarkyMarkov::Dictionary.new("dicts/#{filename}")
    markov.parse_string(text)
    markov.save_dictionary!
  end
end