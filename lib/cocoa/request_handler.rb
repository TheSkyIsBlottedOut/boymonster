module MonsterLibrary
  class RequestHandler
    # take a url and return html
    def path(obj)
      %Q{file://#{Dir.pwd}/#{obj}}
    end

    def default # override
      'no'
    end


    def partial(template, args=nil)
      begin
        __binding__ = binding
        if args
          args.each_pair do |k,v|
            eval("#{k} = #{v};", __binding__)
          end
        end
        return ERB.new(IO.read(BoyMonster.path("/views/#{template}.erb"))).result(__binding__)
      end
    end

    # render 'template path', 'layout path'
    def render(template, layout='layout')
      if layout
        return partial(layout){partial(template)}
        #-> {layout.result(binding)}.call { partial(template) }
      else
        return tmpl.result { partial(template) }
      end
    end

    def __request__(req = 'default')
      request_method, *args = req.split(?/)
      request_method = 'default' unless request_method.to_s =~ /^\w+$/
      request_method = request_method.intern
      if self.respond_to?(request_method)
        arg_arity = self.method(request_method).arity
        if arg_arity < 0
          self.send(request_method, *args)
        elsif arg_arity == 0
          self.send(request_method)
        else
          self.send(request_method, *(args[0..(arg_arity-1)]))
        end
      elsif self.respond_to(:method_missing)
        self.send(request_method, *args)
      else
        raise "No handler method for request #{request_method}!"
      end
    end

    def __handle__(r = nil)
      url_string = r ? r.URL.absoluteString.sub(/^app\:/, '') : 'default'
      html_class = url_string[/^[\w\-]+/]
      <<-HTML
      <html class="#{html_class}">
        <head>
          <style>#{::BoyMonster.styles}</style>
        </head>
        <body>
          #{self.__request__(url_string)}
        </body>
      </html>
      HTML
    end
  end
end