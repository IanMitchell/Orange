class AddCreatedByToPost < ActiveRecord::Migration
  def change
    add_reference :posts, :created_by, index: true
  end
end
