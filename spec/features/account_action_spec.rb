require 'rails_helper'

RSpec.describe 'Account Action', type: :feature do
 describe 'User registration' do
    it 'returns http success' do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_email', with: '12345'
      click_button 'commit'
      expect(page).to have_current_path('/users')
    end
  end

 describe 'Create post' do
    it 'returns http success' do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_email', with: '12345'
      click_button 'commit'
      visit '/posts/new'
      fill_in 'post_title', with: 'New'
      fill_in 'post_summary', with: 'Post'
      fill_in 'post_body', with: 'Create'
      click_on 'Save'
      expect(page).to have_current_path('/posts/1')

    end
  end



end