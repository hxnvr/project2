require 'thin'
require './time_logging_middleware'
require './second_middleware'

app = -> (env) do 
    sleep(3)
  [
    200,
    {'Content-Type' => 'text/html'}, 
    ['<h1>hello world</h1>']
  ]
end

use Rack::Reloader
use SecondMiddleware
use TimeLoggingMiddleware

run app
