feature 'creating links' do

  scenario 'I can create a new link' do

      visit '/add_link'
      fill_in 'title', with: 'Makers Academy'
      fill_in 'url', with: 'http//www.makersacademy.com'
      fill_in 'tag', with: 'Programming'
      click_button "Create link"

      expect(current_path).to eq '/links'

      within 'ul#links' do
        expect(page).to have_content('Makers Academy')
      end

      

  end


end
