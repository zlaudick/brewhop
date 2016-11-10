class AddPasswordDigestToBreweries < ActiveRecord::Migration[5.0]
  def change
    add_column :breweries, :password_digest, :string
  end
end
