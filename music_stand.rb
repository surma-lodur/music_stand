# encoding: utf-8
require 'sinatra/reloader'
require 'java'
require 'pp'

class MusicStand < Sinatra::Base
  autoload :Dir,      File.expand_path('../music_stand/dir', __FILE__)
  autoload :SheetDir, File.expand_path('../music_stand/sheet_dir', __FILE__)
  autoload :Sheet,    File.expand_path('../music_stand/sheet', __FILE__)

  Version     = '0.5'
  RuntimeRoot = Java::JavaLang::System.getProperty("user.dir")
  ConfigPath  = File.join(RuntimeRoot, 'config', 'auth.yml')

  unless File.exist?(ConfigPath)
    File.open(ConfigPath, 'w+') do |file|
      file << "admin: admin\n"
      file << 'password: 1234'
    end
  end
  Config      = YAML.load_file(ConfigPath)
  
  configure :development do
    register Sinatra::Reloader
  end
  
  set :public_folder, RuntimeRoot + '/sheets'
  set :views, settings.root + '/views'
  set :haml, :format => :html5

  use Rack::Auth::Basic do |username, password|
    username == Config['admin'] and password == Config['password']
  end

  get "/" do
    haml :index
  end

  MusicStand::SheetDir.all.each do |music_piece|

    get music_piece.link do
      haml(:show, locals: {
        piece: MusicStand::SheetDir.get(request.path)
      })
    end # get
  end # each
end # MusicStand
