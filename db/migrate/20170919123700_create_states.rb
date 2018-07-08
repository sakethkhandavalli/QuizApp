class CreateStates < ActiveRecord::Migration[5.1]
  def change
    create_table :states do |t|
      t.integer :user_id
      t.integer :subgenre_id
      t.integer :index , default: 0
      t.integer :score , default: 0

      t.timestamps
    end
  end
end
