require 'rails_helper'

RSpec.feature "check cart updates on clicking add to cart button ", type: :feature, js: true do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          image: open_asset('apparel1.jpg'),
          quantity: 10,
          price: 64.99
        )
      end
    end

  scenario "check if cart updates to my cart(1) fro my Cart(0)" do
    # ACT
    visit root_path

    expect(page).to have_content ('My Cart (0)')
    first("article.product").click_on 'Add'
    expect(page).to have_content ('My Cart (1)')
    
    save_screenshot

  end

end
