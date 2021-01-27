class PagesController < ApplicationController

  def home
    @values = api_spotter

    # @markers = []
    # @values[:latitude].each_with_index do |marker, idx|
    #   @markers << { lat: @values[:latitude][idx], lng: @values[:longitude][idx], date_time: @values[:timestamp][idx] }
    # end
  end

  private

  def api_spotter

    response = RestClient.get("http://remobsapi.herokuapp.com/api/v1/data_buoys?buoy=3&start_date=2020-12-28&end_date=2020-12-30&token=#{ENV["SPOTTER_TOKEN"]}")

    spotter_response = JSON.parse(response)
    latitude = []
    longitude = []
    date_time = []
    windspeed = []
    winddirection = []
    significantwaveheight = []
    peakperiod = []
    meanperiod = []
    wavedirection = []
    peakdirection =[]     
    watertemperature = []
    battery = []
    
	  spotter_response.each do |item|
      latitude << item["lat"]
      longitude << item["lon"]
      x = DateTime.parse item["date_time"]
      date_time << x.strftime("%d-%m %H:%M")
      windspeed << item["wspd"]
      winddirection << item["wdir"]    
      significantwaveheight << item["swvht1"]
      peakperiod << item["tp1"]
      meanperiod << item["mean_tp"]   
      wavedirection << item["wvdir1"]
      peakdirection << item["pk_dir"]
      watertemperature << item ["sst"]   
      battery << item ["battery"]      
    end
    
    
    params = {}
    params[:latitude] = latitude
    params[:longitude] = longitude
    params[:date_time] = date_time
    params[:windspeed] = windspeed
    params[:winddirection] = winddirection
    params[:significantwaveheight] = significantwaveheight
    params[:peakperiod] = peakperiod
    params[:meanperiod] = meanperiod
    params[:wavedirection] = wavedirection
    params[:peakdirection] = peakdirection
    params[:watertemperature] = watertemperature    
    params[:battery] = battery
    params = params.to_h
  end
end
