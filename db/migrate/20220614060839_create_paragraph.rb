class CreateParagraph < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphs do |t|
      t.belongs_to :article, index: true
      t.text :content

      t.timestamps
    end
  end
end
