require 'spec_helper'

describe "home page" do
  it 'should login with validated email and password', focus: true do
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in "email", :with => 'admin@example.com'
    fill_in "password", :with => 'admin'
    click_button "Sign In"
    expect(page).to have_selector(".navbar-header")
  end
end