# encoding: utf-8
require 'cgi'

# Internal:   
class MusicStand::Dir
  BaseFolder = 'sheets'
  BasePath   = File.join(MusicStand::RuntimeRoot, BaseFolder)

  attr_accessor :path

  def initialize(options ={})
    self.path = options[:path]
  end

  def name
    File.basename(self.path).encode('UTF-8')
  end # #name

  def link
    "/#{CGI.escape(self.name)}"
  end # #link

  def current?(request)
    if request.path == self.link
      return true
    end
  end # #current_class

  def sheet_dirs
    counter = 0
    ::Dir.glob(File.join(self.path, '*')).map do |file| 
      counter = counter + 1
      MusicStand::SheetDir.new({
        path: file,
        id:   counter
      })
    end
  end # #sheet_dirs

  class << self
    def all
      ::Dir.glob(File.join(BasePath,'*')).map do |dir|
        self.new(path: dir)
      end
    end # .all

    def get(path)
      self.all.detect do |object|
        object.link == path
      end
    end # .get
  end # class << self
end # MusicStand::Dir
