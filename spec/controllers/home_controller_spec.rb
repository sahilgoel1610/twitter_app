require 'rails_helper'

describe HomeController do
  describe "GET show" do
    it "returns best_time and best_day to tweet" do
      # @params = {}
      # @params[:user_name] = 'test'
      allow(GetBestTime).to receive(:for_user).and_return([12,'wednesday'])
      get :show, :user_name => 'test'

      expect(assigns(:best_time)).to eq(12)
      expect(assigns(:best_day)).to eq('wednesday')
    end

    it "renders the show template" do
      get :show
      expect(response).to render_template("show")
    end
  end
end