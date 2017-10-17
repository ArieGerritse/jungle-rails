class Rating < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :rating, presence: true, inclusion: { in: 0..5 }
end
