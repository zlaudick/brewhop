class AddIndexToBreweriesEmail < ActiveRecord::Migration[5.0]
  def change
    add_index :breweries, :email, unique: true
  end
end
