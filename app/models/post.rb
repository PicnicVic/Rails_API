class Post < ApplicationRecord
  belongs_to :user
  has_one :user
  has_one :park
end
