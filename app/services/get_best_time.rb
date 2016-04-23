require 'twitter_api'
require 'util'

class GetBestTime

	class << self
		def for_user(name,id)
			followers = TwitterAPI.get_followers_id(name,id)
			tweets = TwitterAPI.get_tweets(followers)
			
			timestamps = extract_timestamp_from_tweets(tweets)
			probable_time = probable_time(timestamps)
			probable_day = probable_day(timestamps)

			[probable_time, probable_day]
		end

		# returns an array of created_at timestamps from array of tweets
		def extract_timestamp_from_tweets(tweets)
			tweets.map{|tweet| tweet.created_at}	
		end
		
		# Extracts probable time from array of timestamps
		def probable_time(timestamps)
			hours_array = timestamps.map(&:hour)
			
			hours_hash = Util.count_hash_of_elements(hours_array)
			Util.max_value_key(hours_hash)
		end

		# Extracts probable day from array of timestamps
		def probable_day(timestamps)
			week_number = timestamps.map(&:to_date).map(&:wday)
			week_days = week_number.map { |number| Date::DAYNAMES[number]}
			
			days_hash = Util.count_hash_of_elements(week_days)
			Util.max_value_key(days_hash)
		end


	end

end