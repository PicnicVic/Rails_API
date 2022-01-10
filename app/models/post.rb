class Post < ApplicationRecord
  # belongs_to :user, :park
  has_one :user
  has_one :park
end
