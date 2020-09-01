require 'rails_helper'

RSpec.describe "Trackings", type: :request do
    context "GET show" do

        it "it produces an internal error" do
            get URI.encode("/carrier/Ups/tracking/MXN123")
            expect(response).to have_http_status(:internal_server_error)
            expect(response.parsed_body["errors"].count).to eq(1) 
        end

        it "has a invalid carrier" do
            get URI.encode("/carrier/MailAmericas/tracking/MXN123")
            expect(response).to have_http_status(:internal_server_error)
            expect(response.parsed_body["errors"].count).to eq(1) 
        end

        it "has a valid response" do
            get  URI.encode("/carrier/Fedex/tracking/449044304137821|920241085725456")
            expect(response).to have_http_status(:success)
            expect(response.parsed_body["errors"].count).to eq(0) 
        end

    end
end
