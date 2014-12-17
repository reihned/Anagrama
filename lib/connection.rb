require 'active_record'

ActiveRecord::Base.establish_connection({
    :adapter  =>  "postgresql",
    :host     =>  "localhost",
    :username =>  "totallynotadefaultusername",
    :password =>  "totallynotadefaultpassword",
    :database =>  "anagrama"
  })

# ActiveRecord::Base.logger = Logger.new(STDOUT)
