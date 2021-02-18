require 'rails_helper'

RSpec.describe 'Account Action', type: :feature do
  describe 'User registration' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_email', with: '12345'
      click_button 'commit'
    end

    it 'complete registration' do
      r_fill
      expect(page).to have_current_path('/users')
    end
  end

  describe 'Create post' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_email', with: '12345'
      click_button 'commit'
    end
    let(:c_post) do
      visit '/posts/new'
      fill_in 'post_title', with: 'New'
      fill_in 'post_summary', with: 'Post'
      fill_in 'post_body', with: 'Create'
      click_on 'Save'
    end

    it 'complete firs post' do
      r_fill
      c_post
      expect(page).to have_current_path('/posts/1')
    end
  end
end
