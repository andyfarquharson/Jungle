require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save a product" do
      @category = Category.create(name:"Ducks")
      product = Product.new(
        name: "Muscovy",
        price: 21.99,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to be_valid
    expect(product.errors.full_messages).to be_empty
    end
    it "should not save without a valid name" do
      @category = Category.create(name:"Ducks")
      product = Product.new(
        name: nil,
        price: 21.99,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end
    it "should not save without a valid price" do
      @category = Category.create(name:"Ducks")
      product = Product.new(
        name: "Muscovy",
        price_cents: nil,
        quantity: 3,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end
    it "should not save without a valid quantity" do
      @category = Category.create(name:"Ducks")
      product = Product.new(
        name: "Muscovy",
        price: 21.99,
        quantity: nil,
        category_id: @category.id
      )
    expect(product).to_not be_valid
    end
    it "should not save without a valid category" do
      @category = Category.create(name:"Ducks")
      product = Product.new(
        name: "Muscovy",
        price: 21.99,
        quantity: 3,
        category_id: nil
      )
    expect(product).to_not be_valid
    end
  end
end
