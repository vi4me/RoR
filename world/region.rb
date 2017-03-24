require 'fileutils'

class Region
  DATA_FOLDER = './data/'

  attr_accessor :region_id, :title, :country_folder  

  def initialize(region_id, title, country_folder)
    @region_id = region_id
    @title = title
    @country_folder = country_folder #папка страны
  end

  def save                           
    File.open(full_file_path, 'w') do |file|
      file.write(@title)
    end
  end
 
  private

  def full_file_path    #полный путь к папке
    DATA_FOLDER + country_folder + '/' + file_name
  end

  def file_name         #название папки
    "#{@region_id}.txt"
  end
end