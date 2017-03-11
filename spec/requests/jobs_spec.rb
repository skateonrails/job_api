require 'rails_helper'

RSpec.describe "Jobs", type: :request do

  describe "GET /jobs" do
    it "works! (now write some real specs)" do
      get jobs_path, headers: http_login
      expect(response).to have_http_status(200)
    end
  end
end
