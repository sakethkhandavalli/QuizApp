class CreateSubgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :subgenres do |t|
      t.string :name
      t.text :description
      t.integer :genre_id
      t.integer :index

      t.timestamps
    end
  end
end
