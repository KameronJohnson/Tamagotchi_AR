class CreateTamagotchis < ActiveRecord::Migration
  def change
    create_table :tamagotchis do |t|
      t.string :name
      t.integer :activity_level
      t.integer :food_level
      t.integer :sleep_level
      t.boolean :alive

      t.timestamps
    end
  end
end
