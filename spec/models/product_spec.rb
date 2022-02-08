require 'rails_helper'

RSpec.describe Product, type: :model do
  cat= Category.new(name: 'bath')
  subject {
    cat.products.new(name: "watch", price_cents: 10000, quantity: 10)
  }
  describe 'Validations' do
    context "adding a new product" do
      it "is valid if all field are present" do
        expect(subject).to be_valid
      end
      it "is not valid without a name" do
        subject.name = nil
        subject.validate
        expect(subject.errors[:name]).to include("can't be blank")
      end

      it "is not valid without a name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a price_cents" do
        subject.price_cents = nil;
        subject.validate
        expect(subject.errors[:price_cents]).to include("is not a number")
      end

      it "is not valid without a price" do
        subject.price_cents = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a quantity" do
        subject.quantity = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a quantity" do
        subject.quantity= nil
        subject.validate
        expect(subject.errors[:quantity]).to include("can't be blank")
      end

      it "is not valid without a category" do
        subject.category = nil
        expect(subject).to_not be_valid
      end
      it "is not valid without a category" do
        product = Product.new(name: "watch", price_cents: 10000, quantity: 10)
        product.validate
        expect(product.errors[:category]).to include("can't be blank")
      end
    end
  end
end