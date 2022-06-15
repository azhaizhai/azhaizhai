class Paragraph < ApplicationRecord
  belongs_to :article
  has_one :book, through: :article
end