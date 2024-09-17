class RegistrationsController < ApplicationController
  include ActionView::RecordIdentifier
  
  def index
    @registrations = Registration.all
  end

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    if @registration.save
      redirect_to root_path
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('modal', partial: 'form', locals: { registration: @registration }), status: :unprocessable_entity }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy
    redirect_to root_path, notice: 'Registration was successfully destroyed.'
  end

  def register_modal
    @registration = Registration.new
    render turbo_stream: turbo_stream.replace('modal', partial: "form", locals: { registrations_path: @registration })
  end

  private

  def registration_params
    params.require(:registration).permit(:first_name, :last_name, :birthday, :gender, :email, :phone_number, :subject)
  end
end
