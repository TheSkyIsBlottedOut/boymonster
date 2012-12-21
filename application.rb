class Application < ::MonsterLibrary::RequestHandler
  def default
    '<a href="app:funkynummy">click</a>'
  end 
  
  def funkynummy
    '<a href="app:default">unclick</a>'
  end
end