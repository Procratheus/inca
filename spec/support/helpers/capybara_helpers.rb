module Features
  module CapybaraHelpers
    include Warden::Test::Helpers

    def submit_valid_assessment_form
      within('.new_assessment') do
        click_on 'Submit'
      end
    end

    def click_nav_link(link)
      within('ul.nav.nav-pills') do
        find('li.dropdown-toggle').click
        click_on(link)
      end
    end

    def sign_up_with(email, password)
      visit new_user_registration_path
      within first('.new_user') do
        fill_in 'First name', with: 'John'
        fill_in 'Last name', with: 'Foobar'
        fill_in 'user[email]', with: email
        fill_in 'user[password]', with: password
        click_button 'Sign up'
      end
    end

    def signin(email, password)
      visit new_user_session_path
      fill_in 'user[email]', with: email
      fill_in 'user[password]', with: password
      click_button 'Log in'
    end

    def signout_user
      logout
    end

  end
end
