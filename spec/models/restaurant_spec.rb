require 'rails_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than three characters' do
    restaurant = Restaurant.new(name: "kf")
    expect(restaurant).to have(1).error_on(:name)
    expect(restaurant).not_to be_valid
  end


  it "is not valid unless it has a unique name" do
    @user = User.create(email: 'mike@mike.com', password: 'abc123')
    Restaurant.create(name: "Moe's Tavern", user: @user)
    restaurant = Restaurant.new(name: "Moe's Tavern", user: @user)
    expect(restaurant).to have(1).error_on(:name)
  end

end
