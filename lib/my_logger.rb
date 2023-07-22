#check the models folder>walk_observer.rb
#check the walk controller
#check the lib folder

require 'singleton'
class MyLogger
    include Singleton
    def initialize
        @log = File.open("the_log.txt", "a")
		#open the file and append data
    end

    #this will be added to the txt file
	#(information) comes from the controller from the relevant method
    def logInformation(information)
        @log.puts("-----start-----")
        @log.puts(information)
        @log.puts("-----end-----")
        @log.flush
    end
end