class Section < ApplicationRecord
  belongs_to :book
  has_many :articles
end