require "rails_helper"

RSpec.describe "products/index" do

  context "with 1 product" do
    before(:each) do
      assign(:products, [
        Product.create!(:name => "name1",
          :description => "description1",
          :price => 1, :quantity => 2)
      ])
    end

    it "displays all product fields" do
      render

      expect(rendered).to match /name1/
      expect(rendered).to match /description1/
      expect(rendered).to match /1/
      expect(rendered).to match /2/

    end
  end
end
