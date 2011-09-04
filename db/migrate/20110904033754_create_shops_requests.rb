class CreateShopsRequests < ActiveRecord::Migration
  def self.up
    create_table :shops_requests do |t|
      t.string :name
      t.integer :tabelog_id
      t.string :tabelog_url
      t.string :gotochi_category
      t.string :ip_address

      t.timestamps
    end
  end

  def self.down
    drop_table :shops_requests
  end
end
