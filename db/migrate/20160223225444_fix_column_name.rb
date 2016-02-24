class FixColumnName < ActiveRecord::Migration
  def change
	rename_column :reviews, :owner_id, :reviewee_id
  end
end
