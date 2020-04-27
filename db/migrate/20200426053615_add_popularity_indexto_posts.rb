class AddPopularityIndextoPosts < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :popularity
  end
end
