require 'rails_helper'
# require 'spec_helper'

RSpec.describe ListsController, :type => :controller do
# include FactoryGirl
include Devise::TestHelpers

def authenticated_user
  user = User.new(email: "email#{rand}@fake.com", password: 'password')
  user.skip_confirmation!
  user.save
  sign_in user
  user
end

before do
  @user = authenticated_user
end

  describe "POST create" do
    it "creates a list" do
      list_params = {list: {title: "Test List"}}
      current_user = @user
      # p list_params
      expect{
        post :create, list_params
      }.to change(List, :count).by(1)
      # post :create, list_params
      expect(response).to redirect_to(list_path(1))
    end
  end

  describe "PUT update" do
    it "updates a list" do
      list = create(:list)
      list_params = {id: list.id, list: {title: "Updated List"}}
      current_user = @user
      # p list_params
        put :update, list_params
      expect(list.title).to eq("Updated List")
    end
  end

#   describe "GET index" do
#     it "returns http success" do
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#   end
#
  # describe "GET show" do
  #   it "returns http success" do
  #     current_user = @user
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end
#
#   describe "GET new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end
#
  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
