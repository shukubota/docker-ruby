class ChangeTweetApiId < ActiveRecord::Migration[5.0]
  def change
    change_column(:tweets, :tweet_api_id, :string)
  end
end
