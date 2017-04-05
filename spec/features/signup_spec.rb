feature 'signup' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome john@google.co.uk')
    expect(User.first.email).to eq('john@google.co.uk')
  end

end
