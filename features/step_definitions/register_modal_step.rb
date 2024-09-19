# features/step_definitions/sign_up_steps.rb
Given('ฉันกดปุ่มสมัครสมาชิก') do
  @register_modal = RegisterModal.new
  @register_modal.visit_page
  @register_modal.click_register_button
end

When('ฉันจะเห็นหน้าสมัครสมาชิก') do
  @register_modal.saw_page
end

When('ฉันกรอกชื่อ {string}') do |name|
  @register_modal.fill_in_first_name(name)
end

When('ฉันกรอกนามสกุล {string}') do |surname|
  @register_modal.fill_in_last_name(surname)
end

When('ฉันกรอกวันเกิด {string}') do |birthdate|
  @register_modal.fill_in_birthdate(birthdate)
end

When('ฉันกรอกเพศ {string}') do |gender|
  @register_modal.select_gender(gender)
end

When('ฉันกรอกอีเมล {string}') do |email|
  @register_modal.fill_in_email(email)
end

When('ฉันกรอกเบอร์โทรศัพท์ {string}') do |phone_number|
  @register_modal.fill_in_phone_number(phone_number)
end

When('ฉันกรอกเรื่องทำงาน {string}') do |subject|
  @register_modal.select_subject(subject)
end

When('ฉันกดสมัครสมาชิก') do
  @register_modal.submit_form
end

Then('ฉันจะเห็นหน้า {string}') do |page_title|
  @user = RegisteredUesrs.new
  @user.saw_page(page_title)
end

Then('เห็นข้อมูลของฉันดังนี้:') do |data_table|
  @user.saw_registration(data_table)
end
