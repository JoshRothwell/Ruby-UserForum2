class SingletonExample
    class << self
      private
# This is the initial implementation of the singleton file, this code can be called upon in other classes
# specifically used to create debug test printouts in "the_log.txt", used for debugging the creation of new articles.
      def instance
        @instance ||= new
      end
    end
  
    def some_method
      puts "Hello, I am the singleton instance!"
    end
  
    private_class_method :new
  end
  