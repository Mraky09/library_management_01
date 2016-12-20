class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.date :published_date
      t.integer :page_number
      t.references :author, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :publisher, index: true, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
