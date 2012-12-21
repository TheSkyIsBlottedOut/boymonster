module BoyMonster
  class << self
    attr_reader :logger, :root, :app, :styles
    def start(path)
      @logger = MonsterLibrary::Logger.new
      @logger << 'Starting'
      @root = path
      require File.join(@root, 'application.rb')
      @app = MonsterLibrary::Cocoa::AppDelegate.new
      load_styles
      @app.handler = ::Application.new
      @app.run
    end
    
    
    def load_styles
      styles = []
      Dir.glob(File.join(@root, '/css/**/*.css')).each do |stylesheet|
        styles << IO.read(stylesheet)
      end
      @styles = styles.join($/)
    end
  end
end