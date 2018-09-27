class LogSaver
  def initialize(logs)
    @logs = logs
  end

  def save!
    @logs.each do |log|
      save_log(log)
    end
  end

  private

  def save_log(log)
    if (msg = Message.from(log))
      puts "Saving log from \"#{char}\" in file: \"#{filename}\"."
      Homestuck.save!(filename, text)
    else
      puts "Skipping log from \"#{char}\". Add them to the chars hash to save."
      Message.not_saving(msg)
    end
  end
end