class AddTwitterUserNameToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :twitter_user_name, :string
  end
end
