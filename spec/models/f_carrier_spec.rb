require 'rails_helper'

RSpec.describe FCarrier, type: :model do

  context "method select_by_name" do
      before(:all) do
        @fcarrier = FCarrier.new()
      end

      it "when parameter is nil" do
        expect { @fcarrier.select_by_name(nil) }.to raise_error("Unavailable carrier")
      end

      it "when parameter is empty" do
        expect { @fcarrier.select_by_name("") }.to raise_error("Unavailable carrier")
      end

      it "when parameter is valid but model doesn't exist" do
        expect { @fcarrier.select_by_name("Estafeta") }.to raise_error("Unavailable carrier")
      end

      it "when parameter is valid" do
        expect(@fcarrier.select_by_name("Fedex").class.to_s).to eq("FedexCarrier")
      end
  end
  
end
