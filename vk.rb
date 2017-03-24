require 'json'
require 'net/http'
require 'uri'

module VK
  HOST = 'http://vk.com/method/'

  METHODS = {
    countries: 'database.getCountries', # need_all=1
    regions: 'database.getRegions', # count=1000
    cities: 'database.getCities' # need_all=1
  }

  class << self
    def countries
      request(countries_url)
    end

    def regions(country_id)
      request(regions_url(country_id))
    end

    def cities(country_id, region_id)
      request(cities_url(country_id, region_id))
    end

    private

    def countries_url
      HOST + METHODS[:countries] + '?need_all=1'
    end

    def regions_url(country_id)
      HOST + METHODS[:regions] + "?count=1000&country_id= + country_id
    end

    def cities_url(country_id, region_id)
      HOST + METHODS[:cities] + "?need_all=1&country_id=#{country_id}&region_id=#{region_id}"
    end

    def request(url)
      JSON.parse(Net::HTTP.get(URI(url)))['response']
    end
  end
end
