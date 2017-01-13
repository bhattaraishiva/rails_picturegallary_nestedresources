class Category < ApplicationRecord
  validates :name, presence: true

  belongs_to :user
  has_many :pictures
end
