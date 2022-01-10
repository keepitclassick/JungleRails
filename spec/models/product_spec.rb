require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:category) {
    Category.create(name: "testCategory")
  }
  subject {
    category.products.create(
      name: "New Product",
      description: "Look at me I'm a new product!",
      image: "testImage",
      price_cents: 10000,
      quantity: 23,
    )
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
      expect(subject.errors.full_messages).to be_empty
    end
  end
end
