class BookingsController < ApplicationController
  def new
    redirect_to '/' if params[:flight].nil?

    @flight = Flight.find(params[:flight])
    @booking = Booking.new
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @flight = Flight.find(params[:flight])
    @booking = @flight.build_booking(booking_params)
    if @booking.save
      @booking.passengers.each { |pa| PassengerMailer.with(passenger: pa).thank_you.deliver_later }
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:id, :name, :email, :_destroy])
  end
end
