class SecondMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
     status, header, body = @app.call(env)

     body << "You're using #{env["HTTP_USER_AGENT"]}"
     [status, header, body]
  end
end