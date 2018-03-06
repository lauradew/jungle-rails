require 'rails_helper'

RSpec.feature "Visitor product details page by clicking on product", type: :feature, js: true do

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

  scenario "See product details on product page" do
    visit root_path

    first('article.product header').find('a[href^="/products/"]').click

    # commented out b/c it's for debugging only
    # sleep 5
    # save_screenshot "product.png"

    expect(page).to have_content "#{@product.description}"
  end
end