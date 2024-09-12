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
      birthday_in_gregorian = birthday.change(year: birthday.year - 543)
  
      eighteen_years_ago = 18.years.ago.to_date
  
      if birthday_in_gregorian > eighteen_years_ago
        errors.add(:birthday, "You must be at least 18 years old")
      end
    end
  end

end
