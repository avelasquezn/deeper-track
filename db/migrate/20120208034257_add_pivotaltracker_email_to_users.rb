class AddPivotaltrackerEmailToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pivotaltracker_email, :string
  end
end
