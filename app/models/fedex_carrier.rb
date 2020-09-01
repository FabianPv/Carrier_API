class FedexCarrier < Carrier

    def set_connection()
        @connection = Fedex::Shipment.new(self.get_access_data_symbolized)
    end

    def get_tracking_info_response(tracking_code)
        tracking_info_response = @connection.track(package_type: "TRACKING_NUMBER_OR_DOORTAG",tracking_number: tracking_code)
        return tracking_info_response.first
    end

    def extract_data(package,tracking_info_response)
        package.tracking_status = get_package_tracking_status(tracking_info_response.status)
        package.tracking_description = self.name
        return package
    end

    def is_delivered?(status)
        ["At Pickup","Delivered"].include?(status)
    end

    def is_on_transit?(status)
        ["Departed FedEx location","On FedEx vehicle for delivery"].include?(status)
    end

    def is_on_created?(status)
        ["Shipment information sent to FedEx","At FedEx destination facility","At destination sort facility"].include?(status)
    end   
end
