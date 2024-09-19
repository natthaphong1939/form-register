class RegisteredUesrs
  include Capybara::DSL
  include RSpec::Matchers

  def saw_page(index_page)
    expect(page).to have_content(index_page)
  end

  def saw_registration(data_table)
    data_table.hashes.each do |row|
      within("tr#registration_1") do
        expect(page).to have_content(row['First Name'])
        expect(page).to have_content(row['Last Name'])
        expect(page).to have_content(row['Birthday'])
        expect(page).to have_content(row['Gender'])
        expect(page).to have_content(row['Email'])
        expect(page).to have_content(row['Phone'])
        expect(page).to have_content(row['Subject'])
      end
    end
  end

  def delete_registration
    click_button 'Delete'
    page.driver.browser.switch_to.alert.accept
  end

  def saw_no_registration
    expect(page).not_to have_content('#registrations')
  end
end