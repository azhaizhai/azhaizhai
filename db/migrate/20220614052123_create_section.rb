class CreateSection < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.belongs_to :book, index: true
      t.string :title

      t.timestamps
    end
  end
end
