feature 'Viewing links' do

  scenario 'I can see existing links' do

    Link.create(url: 'http//www.makersacademy.com', title: 'Makers Academy')

    visit '/links'

    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

    before(:each) do
      Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search engine')])
      Link.create(url: 'http://www.seaworld.com', title: 'Sea World', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'I can filter links by tag' do
      visit 'tags/bubbles'

      expect(page.status_code).to eq(200)

      within 'ul#links' do
        expect(page).not_to have_content('Google')
        expect(page).to have_content('Sea World')
      end

  end

end
