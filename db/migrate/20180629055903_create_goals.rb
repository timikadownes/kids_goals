class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
      t.string :category
      t.integer :kid_id
      t.string :image_url
      t.date :due_date
      t.text :description

      t.timestamps
    end
  end
end
