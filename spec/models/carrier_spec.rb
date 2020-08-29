require 'rails_helper'

RSpec.describe Carrier, type: :model do
  
  context "method get_access_data_symbolized" do
      before(:all) do
        @carrier_fedex = Carrier.find_by(name: "Fedex")
        @carrier_ups = Carrier.find_by(name: "Ups")
      end

      it "when doesn't have access_connection_datum" do
        expect{@carrier_ups.get_access_data_symbolized()}.to raise_error("Missing Data access_data")
      end

      it "when is valid" do
        expect(@carrier_fedex.get_access_data_symbolized().class.to_s).to eq("Hash")
      end
  end
end
