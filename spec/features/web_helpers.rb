def sign_up_user_one
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'fred@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in_user_two
  visit '/'
  click_link('Sign in')
  fill_in('Email', with: 'mike@test.com')
  fill_in('Password', with: 'abc123')
  click_button('Log in')
end

def user_two_create_restaurant
  @user = User.create(email: 'mike@test.com', password: 'abc123')
  Restaurant.create(name: 'KFC', user: @user)
end
