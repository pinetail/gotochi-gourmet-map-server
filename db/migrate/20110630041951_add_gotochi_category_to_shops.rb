class AddGotochiCategoryToShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :gotochi_category, :string
  end

  def self.down
    remove_column :shops, :gotochi_category
  end
end
