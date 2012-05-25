class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to} #{message.subject} (Intercepted Version)"
    message.to = "artgrabbr@gmail.com"
  end
end