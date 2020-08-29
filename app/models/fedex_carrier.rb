class FedexCarrier < Carrier

    def set_connection()
        @connection = Fedex::Shipment.new(self.get_access_data_symbolized)
    end
    
end
