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

    response = RestClient.get("http://remobsapi.herokuapp.com/api/v1/data_buoys?buoy=2&token=#{ENV["SPOTTER_TOKEN"]}")

    spotter_response = JSON.parse(response)
    latitude = []
    longitude =[]
    datetime =[]
    windspeed = []
    winddirection = []
    significantwaveheight = []
    peakperiod = []
    meanperiod = []
    wavedirection = []
    peakdirection =[]     
    watertemperature = []
    battery = []
    
	  spotter_response[0].each do |item|
      latitude << item["lat"]
      longitude << item["lon"]
      x = item["date_time"]
      datetime = DateTime.parse x
      datetime << datetime.strftime("%d-%m %H:%M")
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
    params[:datetime] = datetime
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
