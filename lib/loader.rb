class Symbol
  def ~@
    _bound = binding
    return ->(arg) {_bound.send(self, arg)}
  end
end
%w{Cocoa WebKit}.map(&~:framework)
Dir.glob('./lib/core_extensions/**/*.rb').map(&~:require)
Dir.glob('./lib/cocoa/**/*.rb').map(&~:require)
Dir.glob('./lib/boy_monster/**/*.rb').map(&~:require)
