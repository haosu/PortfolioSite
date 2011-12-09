class App
  module Views
    class Layout < Mustache
      def title 
        "Hao Su says... #{@title}"
      end
    end
  end
end
