module MonsterLibrary
  module Cocoa
    class MainWindow
      attr_reader :win, :web_view
      def initialize(width, height)
        @win = NSWindow.alloc.initWithContentRect([0, 0, width, height],
          styleMask: NSTitledWindowMask|NSClosableWindowMask|NSMiniaturizableWindowMask|NSResizableWindowMask,
          backing: NSBackingStoreBuffered,
          defer: false
        )
        @win.title = 'Application' # todo: configurable
        @web_view = MainWebView.new(@win)
      end
  
      def delegate=(del)
        @win.setDelegate del
      end
  
      def show
        @web_view.html = @web_view.handler.__handle__
        @win.display
        @win.orderFrontRegardless
      end  
    end
  end
end