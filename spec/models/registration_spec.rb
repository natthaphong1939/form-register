require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe 'validations' do
    let(:valid_attributes) do
      {
        first_name: 'John',
        last_name: 'Doe',
        email: 'john.doe@example.com',
        phone_number: '0812345678',
        birthday: Date.new(2540, 9, 19),
        gender: 'male',
        subject: 'Math'
      }
    end

    it 'is valid with valid attributes' do
      registration = Registration.new(valid_attributes)
      expect(registration).to be_valid
    end

    it 'is invalid without a first_name' do
      registration = Registration.new(valid_attributes.except(:first_name))
      expect(registration).to be_invalid
    end

    it 'is invalid without a last_name' do
      registration = Registration.new(valid_attributes.except(:last_name))
      expect(registration).to be_invalid
    end

    it 'is invalid without an email' do
      registration = Registration.new(valid_attributes.except(:email))
      expect(registration).to be_invalid
    end

    it 'is invalid with a badly formatted email' do
      registration = Registration.new(valid_attributes.merge(email: 'invalid-email'))
      expect(registration).to be_invalid
    end

    it 'is invalid without a phone_number' do
      registration = Registration.new(valid_attributes.except(:phone_number))
      expect(registration).to be_invalid
    end

    it 'is invalid without a birthday' do
      registration = Registration.new(valid_attributes.except(:birthday))
      expect(registration).to be_invalid
    end

    it 'is invalid if the user is under 18 years old' do
      underage_birthday_buddhist_year = 17.years.ago + 543.years
      registration = Registration.new(valid_attributes.merge(birthday: underage_birthday_buddhist_year))
      expect(registration).to be_invalid
    end

    it 'is invalid without a gender' do
      registration = Registration.new(valid_attributes.except(:gender))
      expect(registration).to be_invalid
    end

    it 'is invalid without a subject' do
      registration = Registration.new(valid_attributes.except(:subject))
      expect(registration).to be_invalid
    end
  end
end
