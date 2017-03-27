
# the gemfile isn't needed for this simple server to run.
# a whole web app that requires rack .ru stands for ruby up or rack up
require 'rack'

# this is the class in rack
class App

  # the name of this method must be 'call' and cannot be 'whatever"' this is from Rack, it'll tell us waht is required. We changed it and it gave an error:
#   NoMethodError at /
# undefined method `call' for #<App:0x00000001c35bd0>
# Ruby 	/home/alucinare/.rvm/gems/ruby-2.4.0@rails500/gems/rack-2.0.1/lib/rack/tempfile_reaper.rb: in call, line 15
# Web 	GET localhost/
  def call(env)
    #puts env
    [200,
        {"Content-Type" => "text/html"},
        ["<body><h1>YEAH</h1>Hello World</body>"]
    ] # rack wants us to have at least 3 items in the array, maybe more?? wants us to reply with an array of 3 items.
  end

end

# this will run the new App object
# run is a rack command
run App.new

# I MUST RESTART THE SERVER FOR THIS TO WORK.
# Rack::Lint::LintError at /
# header key must be a string, was Symbol
# Ruby 	/home/alucinare/.rvm/gems/ruby-2.4.0@rails500/gems/rack-2.0.1/lib/rack/lint.rb: in assert, line 20
# Web 	GET localhost/
#
# this is the error that we got with {"Content-Type" : "text/html"}
