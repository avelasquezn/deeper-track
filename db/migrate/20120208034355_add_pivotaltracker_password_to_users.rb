class AddPivotaltrackerPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pivotaltracker_password, :string
  end
end
