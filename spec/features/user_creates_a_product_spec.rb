
feature 'User creates a product' do
  scenario 'they see the product info on the page' do
    visit new_product_path

    fill_in 'Name', with: 'name'
    fill_in 'Description', with: 'description'
    fill_in 'Price', with: 15
    fill_in 'Quantity', with: 3
    click_button 'Create Product'

    attach_file("image[image1]", Rails.root + "spec/fixtures/1.png")
    attach_file("image[image2]", Rails.root + "spec/fixtures/2.png")
    attach_file("image[image3]", Rails.root + "spec/fixtures/3.png")
    attach_file("image[image4]", Rails.root + "spec/fixtures/4.png")
    click_button 'Upload Images'

    expect(page).to have_content('name')
    expect(page).to have_content('description')
    expect(page).to have_content('15')
    expect(page).to have_content('3')
    expect(page).to have_image(alt: '1')
    expect(page).to have_image(alt: '2')
    expect(page).to have_image(alt: '3')
    expect(page).to have_image(alt: '4')
  end
end
