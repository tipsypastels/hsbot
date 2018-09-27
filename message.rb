class Message
  SPEAKER_REGEX = /^[\w]+: /

  class << self
    def from(log)
      text = log.content

      speaker = text.match(SPEAKER_REGEX)
        .to_s.downcase.gsub(': ', '')

      char = CHARS.detect do |name, props|
        log.styles['color'] == props[:color] &&
        props[:names].include?(speaker.to_sym)
      end

      unless char
        puts "Skipping character \"#{speaker}\", not found in chars file..."
        return
      end

      puts "Saving message from \"#{speaker}\"!"
      new(char.first, text)
    end
  end

  attr_reader :char_name, :text

  def initialize(char_name, text)
    @char_name = char_name
    @text = text
  end
end