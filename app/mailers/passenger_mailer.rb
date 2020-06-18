class PassengerMailer < ApplicationMailer
  def thank_you
    @user = params[:passenger]
    mail(to: @user.email, subject: 'Flight Booked!')
  end
end
