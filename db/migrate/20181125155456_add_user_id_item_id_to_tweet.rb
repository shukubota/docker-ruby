class AddUserIdItemIdToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :user_id, :integer
    add_column :tweets, :item_id, :integer
  end
end
