feature 'add multiple tags' do

  scenario 'user can add a second tag' do

    visit '/add_link'
    fill_in 'title', with: 'Makers Academy'
    fill_in 'url', with: 'http//www.makersacademy.com'
    fill_in 'tag', with: 'Programming Yoga'
    click_button "Create link"
    link = Link.first
    expect(link.tags.map(&:name)).to include('Programming', 'Yoga')

  end
end
