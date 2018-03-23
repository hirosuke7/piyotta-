class AddImageNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :hiyokos, :image_name, :string
  end
end
