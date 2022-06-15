class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :author
      t.index :author
      t.string :title
      t.index :title
      t.text :description
      t.timestamps
    end
  end
end
