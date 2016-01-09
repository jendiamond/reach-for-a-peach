require 'rails_helper'

# RSpec.describe PeachesController, type: :controller do

#   describe "GET #index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end

#     it "returns a peach" do
#       get :index
#       peach = FactoryGirl.create(:peach, name: "Find a job", deadline: 5 )
#       expect(peach.count).to eq(1)
#     end
#   end
# end

RSpec.describe PeachesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "populates an array of peaches" do
      peach = create(:peach)
      get :index
      assigns(:peach).should eq([peach])
    end
    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end
  describe "GET #new" do
      it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end