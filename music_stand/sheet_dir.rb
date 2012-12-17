# encoding: utf-8

class MusicStand::SheetDir < MusicStand::Dir

  def sheets
    counter = 0
    ::Dir.glob(File.join(self.path, '*')).map do |file| 
      counter = counter + 1
      MusicStand::Sheet.new({
        sheet_dir: self, 
        file:      file,
        id:        counter
      })
    end
  end # #sheets

  class << self
    def all
      ::Dir.glob(File.join(MusicStand::Dir::BasePath,'*')).map do |dir|
        self.new(path: dir)
      end
    end # .all

    def get(path)
      self.all.detect do |sheet|
        sheet.link == path
      end
    end # .get
  end
end
