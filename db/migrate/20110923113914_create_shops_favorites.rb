class CreateShopsFavorites < ActiveRecord::Migration
  def self.up
    create_table :shops_favorites do |t|
      t.integer :tabelog_id
      t.text :memo

      t.timestamps
    end
  end

  def self.down
    drop_table :shops_favorites
  end
end
