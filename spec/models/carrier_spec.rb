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

  context "method obtein_tracking_info" do
      before(:each) do
        @carrier = Carrier.new()
      end

      it "when params is invalid" do
        @carrier.obtein_tracking_info(234)
        packages, errors = @carrier.get_packages
        expect(packages.count).to eq(0)
      end

      it "when params is empty" do
        @carrier.obtein_tracking_info("")
        packages, errors = @carrier.get_packages
        expect(packages.count).to eq(0)
      end

      it "when params valid and it only has 1 number" do
        @carrier.obtein_tracking_info("MEX123")
        packages, errors = @carrier.get_packages
        expect(packages.count).to eq(1)
      end

      it "when params is valid" do
        @carrier.obtein_tracking_info("123|MEX123|Holamundo132")
        packages, errors = @carrier.get_packages
        expect(packages.count).to eq(3)
      end
  end
end
