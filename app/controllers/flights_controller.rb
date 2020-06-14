class FlightsController < ApplicationController

  def index
    @start_options = Flight.all.map { |f| [f.start.strftime('%m/%d/%Y'), f.start.beginning_of_day] }.uniq.sort
    @flights = nil
    if params[:flight]
      flights = Flight.where("from_airport_id = #{params[:flight][:from_airport_id]} AND to_airport_id = #{params[:flight][:to_airport_id]}") 
      @flights = flights.select { |f| f.start.to_date == DateTime.parse(params[:flight][:start]).to_date }
      @flights.each { |f| p f.start.to_s }
    end
  end
end
