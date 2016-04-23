require 'cgi'
require 'base64'
require 'oauth'
require 'twitter'
class TwitterAPI

	class << self

		# returns the array of follower's id
		def get_followers_id(name, user_id)
			
			begin
				response = Tc.followers(name) if name.present?
				response = Tc.followers(user_id.to_i) if user_id.present? and response.nil?
			rescue Exception => e
				Rails.logger.info e
			end	

			ids = response.map{|follower| follower.id}
			ids
		end


		# get all the timestamps from the array of user_ids passed
		def get_tweets(user_ids)
			query_options = query_options_for_tweets

			responses = []
			
			user_ids.each do |user_id|
				begin
					response =  Tc.user_timeline(user_id,query_options)
				rescue Exception => e
					Rails.logger.info e
				end

				next if response.nil?
				response.each {|tweet| responses << tweet}
			end
			
			responses
		end

		def query_options_for_tweets
			query_options = {} 
			query_options[:count] = 200
			query_options[:trim_user] = true
			query_options[:exclude_replies] = true
			query_options[:contributor_details] = false
			query_options[:include_rts] = false
			query_options
		end
	end
end