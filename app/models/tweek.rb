class Tweek < ActiveRecord::Base
  validates :content, presence: true, length: {maximum: 255}
  belongs_to :user
  paginates_per 10
  max_paginates_per 100
end
