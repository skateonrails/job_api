require 'rails_helper'

RSpec.describe JobsController, type: :controller do
  let(:category) { Category.create! }
  # This should return the minimal set of attributes required to create a valid
  # Job. As you add validations to Job, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { partner_id: 1, title: 'Created Now', category_id: category.id, expires_at: 3.days.from_now.to_date, state: 'active' }
  }

  let(:valid_attributes_with_uncreated_category) {
    { partner_id: 1, title: 'Created Now', category_id: 20, expires_at: 3.days.from_now.to_date, state: 'active' }
  }

  let(:invalid_attributes) {
    { partner_id: 'partner_id', title: 't', category_id: 'category_id', expires_at: 'expires_at' }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # JobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  let(:job) { Job.create! valid_attributes }

  before do
    controller_http_login
  end

  describe "GET #index" do
    it "returns a success response" do
      job
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    context 'with valid id' do
      it "returns a success response" do
        get :show, params: {id: job.id}, session: valid_session
        expect(response).to be_success
      end

      it "renders a JSON response with the job" do
        get :show, params: {id: job.id}, session: valid_session
        expect(response.content_type).to eq('application/json')
      end

      it 'should return a JSON representation of the new job' do
        get :show, params: {id: job.id}, session: valid_session
        json_response = OpenStruct.new(JSON.parse(response.body))

        expect(json_response.partner_id).to eq(job.partner_id)
        expect(json_response.title).to eq(job.title)
        expect(json_response.category_id).to eq(job.category_id)
        expect( Date.parse(json_response.expires_at) ).to eq(job.expires_at)
        expect(json_response.state).to eq(job.state)
      end
    end

    context 'with invalid id' do
      it "returns a not_found response" do
        get :show, params: {id: 1}, session: valid_session
        expect(response).to have_http_status(:not_found)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Job" do
        expect {
          post :create, params: {job: valid_attributes}, session: valid_session
        }.to change(Job, :count).by(1)
      end

      it "creates a new Job and a new Category for this Job" do
        expect {
          post :create, params: {job: valid_attributes_with_uncreated_category}, session: valid_session
        }.to change(Category, :count).by(1)
      end

      it "renders a JSON response with the new job" do
        post :create, params: {job: valid_attributes}, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(job_url(Job.last))
      end

      it 'should return a JSON representation of the new job' do
        post :create, params: {job: valid_attributes}, session: valid_session

        json_response = OpenStruct.new(JSON.parse(response.body))
        expect(json_response.partner_id).to eq(valid_attributes[:partner_id])
        expect(json_response.title).to eq(valid_attributes[:title])
        expect(json_response.category_id).to eq(valid_attributes[:category_id])
        expect( Date.parse(json_response.expires_at) ).to eq(valid_attributes[:expires_at])
        expect(json_response.state).to eq(valid_attributes[:state])
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new job" do
        post :create, params: {job: invalid_attributes}, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe "POST #activate" do
    it "renders a JSON response with the activated job" do
      expect_any_instance_of(Job).to receive(:activate!).and_call_original

      post :activate, params: {id: job.id}, session: valid_session
      expect(response).to be_success
      expect(response.content_type).to eq('application/json')
    end
  end

end
