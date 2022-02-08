require 'rails_helper'

RSpec.feature "after login user redirected to carts page", type: :feature, js: true do
  
    # SETUP
    before :each do

     @user = User.create!(first_name: "simar", last_name: "kk", email: "simar123@gmail.com", password: "key123", password_confirmation: "key123")
     @user.save

    end

  scenario "check if user sucessfully logged in and can see logout button on nav bar" do
    # ACT
    visit '/login'
    
    fill_in 'email', with: 'simar123@gmail.com'
    fill_in 'password', with: 'key123'
    click_button 'Login'
    # after login they sent to cart page as when user is need only login to checkout
    have_xpath '/carts'
    expect(page).to have_content 'Logout'
    save_screenshot

  end

end
