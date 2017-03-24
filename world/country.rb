class Country
  DATA_FOLDER = './data/'        #путь куда сохранять

  attr_accessor :cid, :title

  def initialize(cid, title)     #конструктор принимает параметры
    @cid = cid
    @title = title
  end

  def save                        #сохранение папки если ее нет
    Dir.mkdir(full_folder_path) unless Dir.exist?(full_folder_path) 
  end

  def folder_name                #название папки
    "#{@cid}_#{@title}"
  end

  private

  def full_folder_path           #путь к папке
    DATA_FOLDER + folder_name
  end
end