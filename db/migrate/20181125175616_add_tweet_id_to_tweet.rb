class AddTweetIdToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :tweet_api_id, :integer, unique:true
  end
end
