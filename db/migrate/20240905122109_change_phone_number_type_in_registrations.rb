class ChangePhoneNumberTypeInRegistrations < ActiveRecord::Migration[7.1]
  def change
    change_column :registrations, :phone_number, :string
  end
end