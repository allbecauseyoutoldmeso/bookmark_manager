feature 'Adding tags' do

  scenario 'I can add a tag to a new link' do
    visit '/add_link'
    fill_in 'url', with: 'www.kate.com'
    fill_in 'title', with: 'Kate'
    fill_in 'tag', with: 'Me!'

    click_button 'Create link'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Me!')

  end

end
