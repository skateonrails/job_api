require "rails_helper"

RSpec.describe JobsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/jobs").to route_to("jobs#index")
    end

    it "routes to #show" do
      expect(get: "/jobs/1").to route_to("jobs#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/jobs").to route_to("jobs#create")
    end

    it "routes to #activate" do
      expect(post: "/jobs/1/activate").to route_to("jobs#activate", id: "1")
    end

  end
end
