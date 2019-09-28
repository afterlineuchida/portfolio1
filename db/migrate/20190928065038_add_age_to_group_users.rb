class AddAgeToGroupUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :group_users, :years_old, :string
  end
end
