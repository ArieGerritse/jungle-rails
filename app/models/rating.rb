class Rating < ActiveRecord::Base
  belongs_to :product_id
  belongs_to :user_id

  validates :rating, presence: true, inclusion: { in: 0..5 }
end
