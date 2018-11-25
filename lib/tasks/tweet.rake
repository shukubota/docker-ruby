require "twitter"

namespace :tweet do

task :oembed_get => :environment do

client = Twitter::REST::Client.new do |config|
  config.consumer_key = ''
  config.consumer_secret = ''
  config.access_token = ''
  config.access_token_secret = ''
end

client.user_timeline('tweetを取得したいユーザーのアカウントID',include_rts:false,exclude_replies:true).each do |timeline|
  tweet = client.status(timeline.id)
  tweet_created = tweet.created_at
  oembed = client.oembed(tweet.id).html
  binding.pry
  puts tweet
  
  # new_tweet =Tweet.new(tweet_id:tweet.id,oembed:oembed,tweet_created:tweet_created)
  # new_tweet.save
end
end
end