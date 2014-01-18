class AddBuyerToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :buyer, index: true
  end
end
