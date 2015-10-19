class CreatePuppies < ActiveRecord::Migration
  def change
    create_table :puppies do |t|
      t.text :name
      t.integer :age
      t.text :bio
      t.text :imgurl

      t.timestamps null: false
    end
  end
end
