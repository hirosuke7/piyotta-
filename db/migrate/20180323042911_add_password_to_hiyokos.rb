class AddPasswordToHiyokos < ActiveRecord::Migration[5.1]
  def change
    add_column :hiyokos, :password, :string
  end
end
