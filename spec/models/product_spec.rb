require 'spec_helper'
describe Product do
  let(:product) { Product.new(name: "name", description: "description",
    price: 200, quantity: 2) }
  subject { product }

  it 'must have a name longer than 2 characters' do
    product.name = "n"
    expect { product.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    expect(product.errors).to have_key(:name)
  end

  it 'must have a description longer than 2 characters' do
    product.description = "d"
     expect { product.save! }.to raise_error(
        ActiveRecord::RecordInvalid
      )
     expect(product.errors).to have_key(:description)
  end

  it 'must use integers for quantity' do
  product.quantity = "q"
  expect { product.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    expect(product.errors).to have_key(:quantity)
  end

   it 'must use integers for price' do
  product.price = "p"
  expect { product.save! }.to raise_error(
      ActiveRecord::RecordInvalid
    )
    expect(product.errors).to have_key(:price)
  end
end
