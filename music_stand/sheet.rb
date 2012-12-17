# encoding: utf-8

class MusicStand::Sheet
  attr_accessor :sheet_dir, :full_file
  attr_writer   :id


  def initialize(options = {})
    self.sheet_dir = options[:sheet_dir]
    self.id        = options[:id]
    self.full_file = options[:file].encode('UTF-8')
  end

  def uri
    File.join(sheet_dir.name, self.name) 
  end # #uri

  def name 
    File.basename(self.full_file)
  end # #name

  def id
    "#{self.name.gsub(/\.|_||\s/,'-')}-#{@id}"
  end

  def count
    @id
  end

end
    
