class Book < ApplicationRecord
  has_many :articles
  has_many :paragraphs, through: :articles
  has_many :sections
end