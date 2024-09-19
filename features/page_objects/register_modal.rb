class RegisterModal
  include Capybara::DSL

  def visit_page
    visit '/'
  end

  def click_register_button
    click_button 'register-button'
  end

  def fill_in_first_name(first_name)
    fill_in 'first_name', with: first_name
  end

  def fill_in_last_name(last_name)
    fill_in 'last_name', with: last_name
  end

  def fill_in_birthdate(birthdate)
    fill_in 'birthday', with: birthdate
  end

  def select_gender(gender)
    if gender == 'Male'
      choose 'Male'
    elsif gender == 'Female'
      choose 'Female'
    end
  end

  def fill_in_email(email)
    fill_in 'email', with: email
  end

  def fill_in_phone_number(phone_number)
    fill_in 'phone_number', with: phone_number
  end

  def select_subject(subject)
    select subject, from: 'registration_subject'
  end

  def submit_form
    click_button 'Submit'
  end

  def registration_user(data_table)
    visit_page
    click_register_button
    data_table.hashes.each do |data|
      fill_in_first_name(data['First Name'])
      fill_in_last_name(data['Last Name'])
      fill_in_birthdate(data['Birthday'])
      select_gender(data['Gender'])
      fill_in_email(data['Email'])
      fill_in_phone_number(data['Phone'])
      select_subject(data['Subject'])
    end
    submit_form
  end
end
