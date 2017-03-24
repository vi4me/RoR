class Country
  DATA_FOLDER = './data'

  attr_accessor :cid, :title

  def initialize(cid = nil, title =nil)
    @cid = cid
    @title = title
  end

  def save
    #Dir.mkdir(DATA FOLDER + folder_name)
   Dir.mkdir(full_folder_path) unless Dir.exist?(full_folder_path)
  end  

  private
  
  def folder_name
    "#{@cid}_#{@title}"
  end
end

  # TODO: DZ
 # def regions
   # []
 # end

 # class << self
   # def load!
      #dir = Dir.new(DATA_FOLDER)
    #  res = []
    #  while dir_name = dir.read
     #   unless ['.', '..'].include?(dir_name)
      #    dir_data = dir_name.split('_')
      #    res << new(dir_data.first, dir_data.last)
      #  end
      #end
      #res
    #end
  #end

  #private

  #def full_folder_path
  #  DATA_FOLDER + folder_name
  #end
#end