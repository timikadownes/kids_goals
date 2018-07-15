class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|
      t.string :name
      t.integer :grade
      t.integer :age
      t.string :teacher
      t.string :school
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end
end
