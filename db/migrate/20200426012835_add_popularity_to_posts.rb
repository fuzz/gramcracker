class AddPopularityToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :popularity, :integer, default: 0
  end
end
