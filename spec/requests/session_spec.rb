require 'spec_helper'

describe 'session' do

  describe "login" do
    it 'should login with validated email and password', focus: true do
      user = FactoryGirl.create(:user)
      visit '/'
      fill_in "email", :with => 'admin@example.com'
      fill_in "password", :with => 'admin'
      click_button "Sign In"
      expect(page).to have_selector(".navbar-header")
    end

    it 'should redirect back to login page if email wrong', focus: true do
      user = FactoryGirl.create(:user)
      visit '/'
      fill_in 'email', :with => 'wronguser@example.com'
      fill_in 'password', :with => 'admin'
      click_button "Sign In"
      expect(page).to_not have_selector(".navbar-header")
    end

    it 'should redirect back to login page if password wrong', focus: true do
      user = FactoryGirl.create(:user)
      visit '/'
      fill_in 'email', :with => 'admin@example.com'
      fill_in 'password', :with => 'wrong'
      click_button "Sign In"
      expect(page).to_not have_selector(".navbar-header")
    end
  end

end