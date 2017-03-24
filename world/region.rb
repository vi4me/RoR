class Region
  DATA_FOLDER = './data/'

  attr_accessor :region_id, :title, :country_folder

  def initialize(region_id, title, country_folder)
    @region_id = region_id
    @title = title
    @country_folder = country_folder
  end

  def save
    File.open(full_file_path, 'w') do |file|
      file.write("#{@title}\n")
    end
  end

  class << self
    def load!(country)
      dir_country = Dir.new(country.full_folder_path)
      region_files = dir_country.map { |file_name| file_name }
                       .select { |file_name| !['.', '..'].include?(file_name) }
      region_files.map do |file_name|
        new(file_name.gsub('.txt', ''),
            File.readlines("#{country.full_folder_path}/#{file_name}").first.strip,
            country.full_folder_path)
      end
    end
  end

  def cities
    City.load!(self)
  end

  def full_file_path
    DATA_FOLDER + country_folder + '/' + file_name
  end

  private

  def file_name
    "#{@region_id}.txt"
  end
end