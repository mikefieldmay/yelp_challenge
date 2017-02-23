class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :name, length: { minimum: 3 }, uniqueness: true

  def build_review(params, user)
    review = self.reviews.new(params)
    review.user = user
    return review
  end
end
