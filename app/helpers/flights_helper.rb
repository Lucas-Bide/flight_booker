module FlightsHelper

  def selected_airport_value
    if params[:flight]
      params[:flight][:to_airport_id]
    else
      Airport.first.id
    end
  end

  def selected_start_value
    if params[:flight]
      [DateTime.parse(params[:flight][:start]).strftime('%m/%d/%Y'), params[:flight][:start]]
    else
      [Flight.first.start.strftime('%m/%d/%Y'), Flight.first.start.beginning_of_day]
    end
  end
end
