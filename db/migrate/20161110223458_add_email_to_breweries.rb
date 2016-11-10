class AddEmailToBreweries < ActiveRecord::Migration[5.0]
  def change
    add_column :breweries, :email, :string
  end
end
