require 'rails_helper'

RSpec.describe 'Categories index page', type: :system do
  describe 'Content displayed by this page' do
    before(:all) do
      @user = User.create(name: 'nacho', password: '123456', email: 'nacho@gmail.com')
      @categoty = Category.create(name: "Food", icon: "https://picsum.photos/200", user: @user)
    end

    before(:each) do
      visit new_user_session_path
      page.fill_in 'Email', with: 'nacho@gmail.com'
      page.fill_in 'Password', with: '123456'
      sleep(3)
      click_button 'LOG IN'
      sleep(3)
    end

    after(:all) do
      @user.destroy
    end

    it 'should shows the correct content' do
      visit categories_path
      sleep(3)
      expect(page).to have_content('Food')
      expect(page).to have_css('img', text: "https://picsum.photos/200")
      expect(page).to have_content("$ 0")
    end
  end
end
