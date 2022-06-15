class CreateArticle < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.belongs_to :book, index: true
      t.belongs_to :section, index: true
      t.string :author
      t.index :author
      t.string :title
      t.index :title
      t.text :description

      t.timestamps
    end
  end
end
