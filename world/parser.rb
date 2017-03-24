require_relative './vk'
require_relative './country'
require_relative './region'

VK::countries.each do |country_data|
  country_data # {"cid"=>98, "title"=>"Колумбiя"}
  country = Country.new(country_data['cid'], country_data['title'])

  country.save

  VK::regions(country.cid).each do |region_data|
    region = Region.new(region_data['region_id'],
                        region_data['title'],
                        country.folder_name)

    region.save
  end
end
