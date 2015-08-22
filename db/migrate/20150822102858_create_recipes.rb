class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :occassion
      t.float :rating
      t.string :image
      t.text :preparation
      t.text :ingridients
      t.string :description
      t.string :mealtype
      t.string :cuisine
      t.string :title

      t.timestamps

    end
  end
end
