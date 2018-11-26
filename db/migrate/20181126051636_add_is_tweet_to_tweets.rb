class AddIsTweetToTweets < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :is_tweet, :boolean
  end
end
