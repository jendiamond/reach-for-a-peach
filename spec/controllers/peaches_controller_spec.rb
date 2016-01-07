require 'rails_helper'

RSpec.describe PeachesController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "returns a peach" do
      get :index
      peach = Peach.create(name: "Find a job", deadline: 9 )
      expect(peach.count).to eq 1
    end
  end
end
