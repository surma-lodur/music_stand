# encoding: utf-8
require 'sinatra/reloader'
require 'pp'

class MusicStand < Sinatra::Base
  autoload :Dir,      'music_stand/dir'
  autoload :SheetDir, 'music_stand/sheet_dir'
  autoload :Sheet,    'music_stand/sheet'

  Version = '0.1'
  
  configure :development do
    register Sinatra::Reloader
  end
  
  set :public_folder, File.dirname(__FILE__) + '/sheets'
  set :views, settings.root + '/views'
  set :haml, :format => :html5

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
