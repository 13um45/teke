
feature 'User creates a product' do
  scenario 'they see the product info on the page' do
    visit new_product_path

    fill_in 'Name', with: 'name'
    fill_in 'Description', with: 'description'
    fill_in 'Price', with: 15
    fill_in 'Quantity', with: 3
    click_button 'Create Product'

    expect(page).to have_content('name')
    expect(page).to have_content('description')
    expect(page).to have_content('15')
    expect(page).to have_content('3')
  end
end
