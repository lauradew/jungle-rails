require 'rails_helper'

RSpec.describe Product, type: :model do
  before :example do
    @homewares = Category.find_or_create_by! name: 'Homewares'
    @planter = @homewares.products.create!({ name: 'Planter', price_cents: 34.99, quantity: 7 })
  end

  after :example do
    @homewares.products.destroy_all
    @homewares.destroy!
  end

  describe 'Validations' do
    it "is valid with a name, price, quantity, and category" do
      expect(@planter.valid?).to eq true
    end
    it "is invalid without name" do
      @planter.name = nil
      expect(@planter.valid?).to eq false
    end
    it "is invalid without price" do
      @planter.price_cents = nil
      expect(@planter.valid?).to eq false
    end
    it "is invalid without quantity" do
      @planter.quantity = nil
      expect(@planter.valid?).to eq false
    end
    it "is invalid without category" do
      @planter.category = nil
      expect(@planter.valid?).to eq false
    end

  end
end
