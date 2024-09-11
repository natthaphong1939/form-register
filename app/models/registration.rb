class Registration < ApplicationRecord    
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
  validates :birthday, presence: true
  validates :gender, presence: true
  validates :subject, presence: true
  
  validate :check_birthday_age

  private

  def check_birthday_age
    if birthday.present?
      if birthday > 18.years.ago.to_date
        errors.add(:birthday, "You must be at least 18 years old")
      end
    end
  end

end
