class SingletonExample
    class << self
      private
  
      def instance
        @instance ||= new
      end
    end
  
    def some_method
      puts "Hello, I am the singleton instance!"
    end
  
    private_class_method :new
  end
  