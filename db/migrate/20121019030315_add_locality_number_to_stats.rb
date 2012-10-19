class AddLocalityNumberToStats < ActiveRecord::Migration
  def change
    add_column :stats, :locality_number, :integer
  end
end
