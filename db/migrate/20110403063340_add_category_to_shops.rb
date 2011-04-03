class AddCategoryToShops < ActiveRecord::Migration
  def self.up
    add_column :shops, :category, :integer
  end

  def self.down
    remove_column :shops, :category
  end
end
