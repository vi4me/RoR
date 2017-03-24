require 'json'
require 'net/http'          #делать запросы
require 'uri'               #создавать урлу

module VK               #
  HOST = 'https://api.vk.com/method/'      #константа

  METHODS = {                       #методы изьятия из вк
    countries: 'database.getCountries', # need_all=1  #параметр вк
    regions: 'database.getRegions', # count=1000      #параметр вк
    cities: 'database.getCities' # need_all=1         #параметр вк
  }

  class << self
    def countries
      request(countries_url)
    end

    def regions(country_id)         #методы изьятия из вк
      request(regions_url(country_id))
    end

    def cities(country_id, region_id)   #методы изьятия из вк
      request(cities_url(country_id, region_id))
    end

    private

    def countries_url           #построение урлы
      HOST + METHODS[:countries] + '?need_all=1'
    end

    def regions_url(country_id)   #построение урлы(зависит от)
      HOST + METHODS[:regions] + "?count=1000&country_id=#{country_id}"
    end
         # https://api.vk.com/method/database.getCities?country_id=2&region_id=1500595
    def cities_url(country_id, region_id)   #построение урлы (зависит от)
      HOST + METHODS[:cities] + "?need_all=1&country_id=#{country_id}&region_id=#{region_id}"
    end

    def request(url)          # посылает запрос, парсит ури в урл чтобы получить 
      JSON.parse(Net::HTTP.get(URI(url)))['response']  #ключ респонс
    end
  end
end
