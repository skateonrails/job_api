require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  let(:category) { Category.create! }

  let(:valid_session) { {} }

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: category.id}, session: valid_session
      expect(response).to be_success
    end
  end

end
