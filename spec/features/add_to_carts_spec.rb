require 'rails_helper'

RSpec.feature "Visitors can add product to cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    @product = @category.products.create!(
      name:  'Cool shirt',
      description: 'Super cool shirt',
      image: open_asset('apparel1.jpg'),
      quantity: 10,
      price: 12.99
    )
  end

  scenario "User can add product to cart and cart displays 1" do
    visit root_path

    first('article.product').find_link('Add').click

    # commented out b/c it's for debugging only
    # save_screenshot "product.png"

    expect(page.find('#navbar')).to have_content "My Cart (1)"
  end
end