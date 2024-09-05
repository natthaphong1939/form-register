class RegistrationsController < ApplicationController
  def index
    @registration = Registration.all
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to root_path, notice: "Thank you for registering!"
    else
      render :index
    end
  end

  private

  def registration_params
    params.require(:user).permit(:first_name, :last_name, :birthday, :gender, :email, :phone_number, :subject)
  end
end
