require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They see the details of an individual product" do
    visit root_path
    expect(page).to have_css '.products-index'

    first('.product').click_link('Details')
    expect(page).to have_css '.products-show'

    # DEBUG
    save_screenshot
  end
end
