feature 'User edits a product' do
    background do
        @post = Product.create!(:name => 'name',
            :description => 'description', :price => 3,
            :quantity => 5)
    end
  scenario 'they see the product info on the page' do
    visit edit_product_path(@post)

    fill_in 'Name', with: 'Testing'
    fill_in 'Description', with: 'description'
    fill_in 'Price', with: 15
    fill_in 'Quantity', with: 3
    click_button 'Update Product'

    expect(page).to have_content('Testing')
    expect(page).to have_content('description')
    expect(page).to have_content('15')
    expect(page).to have_content('3')
  end
end
