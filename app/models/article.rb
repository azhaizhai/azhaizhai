class Article < ApplicationRecord
  has_many :paragraphs
  belongs_to :book
  belongs_to :section, required: false
end