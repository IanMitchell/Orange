class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :post, index: true
      t.references :user, index: true
      t.references :owner, index: true
      t.string :feedback
      t.integer :score, default: 0

      t.timestamps
    end
  end
end
