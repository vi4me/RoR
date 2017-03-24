class City
  attr_accessor :city_id, :title, :region

  def initialize(city_id, title, region)
    @region = region
    @title = title
    @city_id = city_id
  end

  def save
    return false unless File.exist?(region.full_file_path)
    File.open(region.full_file_path, 'a+') do |file|
      file.write("#{@city_id} => #{@title}\n")
    end
  end

  class << self
    def load!(region)
      cities_data = File.readlines(region.full_file_path)
      cities_data.delete_at(0)
      cities_data.map do |city_data|
        city_data_arr = city_data.split(' => ')
        new(city_data_arr.first.strip, city_data_arr.last.strip, region)
      end
    end
  end
end