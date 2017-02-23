describe User do
  it { should have_many :restaurants }
end

describe Restaurant do
  it { should belong_to :user }
  it { should have_many :reviews}
end

describe Review do
  it { should belong_to :user }
  it { should belong_to :restaurant }
end
