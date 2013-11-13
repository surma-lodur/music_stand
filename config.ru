require 'rubygems'
require 'bundler'
Bundler.require


#set :run, false
#set :public, './public'
#set :views, './views'
#set :environment, :production

require './music_stand'
run MusicStand
