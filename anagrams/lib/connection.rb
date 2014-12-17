require 'active_record'

ActiveRecord::Base.establish_connection({
    :adapter  =>  "postgresql",
    :host     =>  "localhost",
    :username =>  "ray",
    :password =>  "password",
    :database =>  "anagrama"
  })

# ActiveRecord::Base.logger = Logger.new(STDOUT)
