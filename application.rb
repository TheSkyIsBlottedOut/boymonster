class Application < ::MonsterLibrary::RequestHandler
  def default
    render 'default'
  end
end