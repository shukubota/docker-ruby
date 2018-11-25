class AddHtmlContentToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :html_content, :text
  end
end
