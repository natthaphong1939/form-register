class RegistrationsController < ApplicationController
  def index
  end

  def new
    @registration = Registration.new
  end

  def show
    @registrations = Registration.all
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to registration_url(@registration)
    else
      render :index
    end
  end
  
  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone_number, :subject)
  end
end
