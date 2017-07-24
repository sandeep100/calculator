require 'rails_helper'
RSpec.describe OperationsController, type: :controller do
	describe "#perform controller rspec" do

    it "renders the new template" do
      post :new#, format: :js
      expect(response).to render_template("new")
    end

    it "renders the perform template" do
      post :perform, format: :js
      expect(response).to render_template("perform")
    end
  end   
end