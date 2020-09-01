require 'rails_helper'

RSpec.describe FedexCarrier, type: :model do

  before(:all) do
    @carrier = FCarrier.new().select_by_name("Fedex")
    @carrier.set_connection()
  end
  
  context "method set_connection" do
      it "when stablish connection" do
        @carrier.set_connection() 
        expect(@carrier.nil?).to eq(false)
      end
  end

  context "method get_tracking_info_response" do
      it "when params are valid" do
        response = @carrier.get_tracking_info_response("449044304137821")
        expect(response.nil?).to eq(false)
      end
  end

  context "method extract_data" do
      it "when params are valid" do
        tracking_info = @carrier.get_tracking_info_response("449044304137821")
        result = @carrier.extract_data(Package.new("449044304137821"),tracking_info)
        expect(result.nil?).to eq(false)
        expect(result.id).to eq("449044304137821")
        expect(result.tracking_info.blank?).to eq(false)
      end
  end

  context "method is_delivered?" do
      it "when params are valid" do
        result = @carrier.is_delivered?("On transit")
        expect(result).to eq(false)
      end

      it "when params are valid" do
        result = @carrier.is_delivered?("Delivered")
        expect(result).to eq(true)
      end
  end

  context "method is_on_transit?" do
      it "when params are valid" do
        result = @carrier.is_on_transit?("Departed FedEx location")
        expect(result).to eq(true)
      end

      it "when params are valid" do
        result = @carrier.is_on_transit?("Delivered")
        expect(result).to eq(false)
      end
  end

  context "method is_on_created?" do
      it "when params are valid" do
        result = @carrier.is_on_created?("Shipment information sent to FedEx")
        expect(result).to eq(true)
      end

      it "when params are valid" do
        result = @carrier.is_on_created?("Delivered")
        expect(result).to eq(false)
      end
  end

  



end
