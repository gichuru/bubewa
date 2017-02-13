class AddUserIdToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :user_id, :integer
  end
end
