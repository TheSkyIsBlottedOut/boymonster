module MonsterLibrary
  module Cocoa
    class AppDelegate
      attr_reader :app, :win
      def initialize
        @app = NSApplication.sharedApplication
        @app.setDelegate self
        @win = MainWindow.new(640, 480) # todo: configurable
        @win.delegate = self
      end
      
      def handler=(klass)
        @win.web_view.handler = klass
      end
      
      def handler
        @win.web_view.handler
      end
  
      def windowWillClose(*args)
        exit
      end
  
      def run
        @win.show
        @app.run
      end
    end
  end
end