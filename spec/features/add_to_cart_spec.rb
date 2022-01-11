require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
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
    scenario "Cart is updated when add to cart is clicked" do
      visit root_path

      expect(page).to have_content("My Cart (0)")
      within(".product:nth-of-type(1)") { click_button "Add" }

      
      expect(page).to_not have_content("My Cart (0)")
      save_screenshot
      expect(page).to have_content("My Cart (1)")
      
  end
end
