class CreateShops < ActiveRecord::Migration
  def self.up
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :category
      t.integer :tabelog_id
      t.string :business_hours
      t.string :holiday
      t.float :latitude
      t.float :longitude
      t.float :score
      t.string :tabelog_url
      t.string :tabelog_mobile_url
      t.string :station
      t.text :memo

      t.timestamps
    end
  end

  def self.down
    drop_table :shops
  end
end
