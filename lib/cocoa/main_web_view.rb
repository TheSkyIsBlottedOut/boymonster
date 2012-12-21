module MonsterLibrary
  module Cocoa
    class MainWebView
      attr_accessor :handler
      def initialize(parent)
        @win = parent
        @view = WebView.alloc.initWithFrame([0,0,@win.frame.size.width, (@win.frame.size.height - 20)])
        @view.policyDelegate = self
        @win.contentView.addSubview @view
        @handler = ::MonsterLibrary::RequestHandler.new
      end
      

      def html=(s)
        @view.mainFrame.loadHTMLString(s, baseURL: nil)
      end
  
      def webView(view,
          decidePolicyForNavigationAction: action,
          request: request,
          frame: frame,
          decisionListener: listener
        )
        a = {view: view, action: action, request: request, frame: frame, listener: listener}
        if request.URL.scheme =~ /^app/
          self.html = @handler.__handle__(request)
          false
        else
          listener.use
          true
        end
      end
    end
  end
end