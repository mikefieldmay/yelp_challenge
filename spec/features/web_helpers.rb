def sign_up_user_1
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'fred@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in_mike
  visit '/'
  click_link('Sign in')
  fill_in('Email', with: 'mike@test.com')
  fill_in('Password', with: 'abc123')
  fill_in('Password confirmation', with: 'abc123')
  click_button('Sign up')
end
