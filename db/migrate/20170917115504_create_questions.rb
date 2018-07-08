class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :subgenre_id
      t.string :qtype
      t.string :opt1
      t.string :opt2
      t.string :opt3
      t.string :opt4
      t.string :crt1
      t.string :crt2
      t.string :crt3
      t.string :crt4

      t.timestamps
    end
  end
end
