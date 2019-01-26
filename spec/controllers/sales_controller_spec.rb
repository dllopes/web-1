require 'rails_helper'

RSpec.describe SalesController, type: :controller do

  let(:user) { create :user }

  before do
    sign_in user
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "POST #import_file_table" do
    context "with valid params" do
      it "creates new Sales" do
        expect {
          post :import_file_table, params: {sale: {file_table: file}}, format: :js
        }.to change(Sale, :count).by(4)
      end
    end

    context "with invalid params" do
      it "does not creates new Sales" do
        post :import_file_table, params: {sale: {file_table: nil}}, format: :js
        expect{response}.to change(Sale, :count).by(0)
        expect(response.status).to eq 200
      end
    end
  end

end

def file
  Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/support/files/example_input.tab')))
end
