def sign_up
  visit '/signup'
  expect(page.status_code).to eq(200)
  fill_in 'email', with: 'john@google.co.uk'
  fill_in 'password', with: 'letmein01'
  click_button 'Sign up'
end
