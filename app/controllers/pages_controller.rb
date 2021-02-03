class PagesController < ApplicationController

  def home

    if params[:start_date].present? && params[:end_date].present?
      @end_date = "#{params[:end_date]}"
      @start_date = "#{params[:start_date]}"
    else
      @end_date = Time.now.utc.strftime("%Y-%m-%d")
      @start_date = (Time.now.utc - 10 * 86400).strftime("%Y-%m-%d")
    end

    @values = api_spotter(@start_date, @end_date) 

    @markers = []
    @values[:latitude].each_with_index do |marker, idx|
      @markers << { lat: @values[:latitude][idx].to_f, lng: @values[:longitude][idx].to_f, dtm: @values[:date_time][idx] }
    end


    @deploy = {
      lat: -62.209516,
      lng: -58.28005
    }
  end

  private

  def api_spotter(start_date, end_date)

    response = RestClient.get("http://remobsapi.herokuapp.com/api/v1/data_buoys?buoy=3&start_date=#{start_date}&end_date=#{end_date}&token=#{ENV["SPOTTER_TOKEN"]}")

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
    date_time2= []

	  spotter_response.each do |item|
      latitude << item["lat"]
      longitude << item["lon"]
      x = DateTime.parse item["date_time"]
      date_time << x.strftime("%d-%m %H:%M")
      windspeed << item["wspd"].to_f
      winddirection << item["wdir"]    
      significantwaveheight << item["swvht1"].to_f
      peakperiod << item["tp1"].to_f
      meanperiod << item["mean_tp"]   
      wavedirection << item["wvdir1"]
      peakdirection << item["pk_dir"]
      if item["sst"]
        watertemperature << item ["sst"].to_f
        date_time2 << x.strftime("%d-%m %H:%M")
      end
      battery << item ["battery"]      
    end
    
    
    params = {}
    params[:latitude] = latitude
    params[:longitude] = longitude
    params[:date_time] = date_time
    params[:date_time2] = date_time2
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
