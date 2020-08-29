require 'rails_helper'

RSpec.describe FedexCarrier, type: :model do
  
  context "method set_connection" do
      before(:all) do
        @carrier = FCarrier.new().select_by_name("Fedex")
      end

      it "when stablish connection" do
        @carrier.set_connection() 
        expect(@carrier.nil?).to eq(false)
      end
  end

end
