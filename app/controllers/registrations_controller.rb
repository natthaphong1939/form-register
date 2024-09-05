class RegistrationsController < ApplicationController
  def index
    @registration = Registration.new
  end
end
