class LogSaver
  def initialize(logs)
    @logs = logs
  end

  def save!
    @logs.each do |log|
      unless log.content.start_with?('[') # skip pestering notifs
        save_log(log)
      end
    end
  end

  private

  def save_log(log)
    if (msg = Message.from(log))
      Homestuck.save!(msg)
    else
    end
  end
end