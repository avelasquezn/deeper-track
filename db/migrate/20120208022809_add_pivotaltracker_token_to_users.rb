class AddPivotaltrackerTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pivotaltracker_token, :string
  end
end
