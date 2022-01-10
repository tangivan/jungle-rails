require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save all fields correctly' do
      @category = Category.new(:name => "Weird Products")
      @product = Product.new(
        :name => 'Iron Banana',
        :price => 4000,
        :quantity => 1,
        :category => @category
      )
      expect(@product).to be_valid
    end
    it 'name should be nil' do
      @category = Category.new(:name => "Weird Products")
      @product = Product.new(
        :price => 4000,
        :quantity => 1,
        :category => @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end
    it 'price should be nil' do
      @category = Category.new(:name => "Weird Products")
      @product = Product.new(
        :name => 'Iron Banana',
        :quantity => 1,
        :category => @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end
    it 'quantity should be nil' do
      @category = Category.new(:name => "Weird Products")
      @product = Product.new(
        :name => 'Iron Banana',
        :price => 4000,
        :category => @category
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end
    it 'category should be nil' do
      @category = Category.new(:name => "Weird Products")
      @product = Product.new(
        :name => 'Iron Banana',
        :price => 4000,
        :quantity => 1,
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
