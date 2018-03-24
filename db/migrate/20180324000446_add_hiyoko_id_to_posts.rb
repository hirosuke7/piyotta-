class AddHiyokoIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :hiyoko_id, :integer
  end
end
