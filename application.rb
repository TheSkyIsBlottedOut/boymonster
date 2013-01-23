require 'sample_class'
class Application < ::MonsterLibrary::RequestHandler
  def default
    render 'default'
  end
end