class SearchController < ApplicationController
  def new
  end

  def results
    results = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{params[:zipcode]}&APPID=#{Figaro.env.open_map_api_key}&units=imperial")

    if results.code == 200
    #conditions
    @name = results['name']
    @description = results['weather'].first['description']
    @temp = results['main']['temp']
    @temp_high = results['main']['temp_max']
    @temp_low = results['main']['temp_min']
    @humidity = results['main']['humidity']
    @icon = results['weather'].first['icon']
  else
    @error_message = results['message']
  end
  end
end
