class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} (Intercepted Version)"
    message.to = "nick.joosung.hwang@gmail.com"
  end
end