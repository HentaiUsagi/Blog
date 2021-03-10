require 'rails_helper'

RSpec.describe 'Account Action', type: :feature do
  describe 'User registration' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'cosiposha@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
    end

    it 'registration' do
      r_fill
      expect(page).to have_current_path('/')
    end
  end

  describe 'User sign in' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'cosiposha@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
    end
    let(:s_in) do
      click_on 'Sign out'
      visit '/users/sign_in'
      fill_in 'user_email', with: 'cosiposha@mail.com'
      fill_in 'user_password', with: '12345'
      click_button 'Sign in'
    end

    it 'sign in' do
      r_fill
      s_in
      expect(page).to have_current_path('/')
    end
  end

  describe 'User create new post' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
    end
    let(:c_post) do
      visit '/posts/new'
      fill_in 'post_title', with: 'Create'
      fill_in 'post_summary', with: 'new'
      fill_in 'post_body', with: 'post'
      click_button 'Save'
    end

    it 'create new post' do
      r_fill
      c_post
      expect(page).to have_current_path('/posts/1')
    end
  end

  describe 'User create new post and edit him' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
    end
    let(:c_post) do
      visit '/posts/new'
      fill_in 'post_title', with: 'Create'
      fill_in 'post_summary', with: 'new'
      fill_in 'post_body', with: 'post'
      click_button 'Save'
    end

    let(:p_edit) do
      click_on 'Edit'
      fill_in 'post_title', with: 'Creat'
      fill_in 'post_summary', with: 'ne'
      fill_in 'post_body', with: 'pos'
      click_button 'Save'
    end

    it 'edit post' do
      r_fill
      c_post
      p_edit
      expect(page).to have_current_path('/posts/2')
    end
  end

  describe 'User create new post and delete him' do
    let(:r_fill) do
      visit '/users/sign_up'
      fill_in 'user_email', with: 'user@mail.com'
      fill_in 'user_password', with: '12345'
      fill_in 'user_password_confirmation', with: '12345'
      click_button 'Sign up'
    end

    let(:c_post) do
      visit '/posts/new'
      fill_in 'post_title', with: 'Create'
      fill_in 'post_summary', with: 'new'
      fill_in 'post_body', with: 'post'
      click_button 'Save'
    end

    let(:p_delete) do
      click_on 'Delete'
    end

    it 'delete post' do
      r_fill
      c_post
      p_delete
      expect(page).to have_current_path('/posts')
    end
  end
end
