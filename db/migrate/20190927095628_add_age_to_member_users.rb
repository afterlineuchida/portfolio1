class AddAgeToMemberUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :member_users, :age, :integer
  end
end
