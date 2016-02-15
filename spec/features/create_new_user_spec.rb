feature 'create a new user' do
  scenario 'they see Created user' do
    visit new_users_path

    fill_in 'Username', with: 'user1'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'pasword'
    click_button 'Create User'

    expect(page.find('.alert')).to have_content 'Created user'
    puts body
  end
end
