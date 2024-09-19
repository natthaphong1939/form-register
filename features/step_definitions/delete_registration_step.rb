Given('ฉันเห็นข้อมูลของฉันดังนี้:') do |data_table|
  @register = RegisterModal.new
  @register.registration_user(data_table)
end

When('ฉันกดลบข้อมูลของฉัน') do
  @user = RegisteredUesrs.new
  @user.delete_registration
end

Then('ข้อมูลของฉันจะหายไป') do
  @user.saw_no_registration
end