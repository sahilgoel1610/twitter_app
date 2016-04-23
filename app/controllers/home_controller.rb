class HomeController < ApplicationController

	def show
		clean_params
		@best_time = @best_day = nil
		@best_time, @best_day = GetBestTime.for_user(params[:user_name], params[:user_id]) if params[:user_id].present? || params[:user_name].present?
	end

	private

	def clean_params
		params[:user_name] = params[:user_name].chomp if params[:user_name].present?
		params[:user_id] = params[:user_id].chomp if params[:user_id].present?
	end

end
