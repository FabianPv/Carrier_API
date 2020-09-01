class Carrier < ApplicationRecord
    attr_accessor :connection, :response , :packages, :failed_packages
    has_one :access_connection_datum
    accepts_nested_attributes_for :access_connection_datum, allow_destroy: true

    enum status: { created: "CREATED", on_transit: "ON_TRANSIT", delivered: "DELIVERED",  exception: "EXCEPTION"}, _prefix: :status

    scope :active, -> { where(status: "Active")}

    def initialize(*args)
        super
        @packages = []
        @failed_packages = []
        @connection = nil
    end

    def get_access_data_symbolized
        raise 'Missing Data access_data' if self.access_connection_datum.blank? || self.access_connection_datum.access_data.blank?
        self.access_connection_datum.access_data.symbolize_keys
    end

    def connection_stable?
        !@connection.nil?
    end

    def get_packages
        return @packages, @failed_packages
    end

    def get_tracking_info_response(tracking_code)
        
    end

    def extract_data(package,tracking_info)
        return package
    end

    def get_package_tracking_status(status_response)
        return Status::CREATED if is_on_created?(status_response)
        return Status::DELIVERED if is_delivered?(status_response)
        return Status::ON_TRANSIT if is_on_transit?(status_response)
        return Status::EXCEPTION
    end

    def obtein_tracking_info(numbers)
        return if numbers.class.to_s != "String"
        numbers.split('|').each_with_index do |tracking_code,index|
            new_package = Package.new(tracking_code)
            begin
                tracking_info_response = get_tracking_info_response(tracking_code)
                extract_data(new_package,tracking_info_response)
                @packages << new_package
            rescue => exception
                new_package.tracking_info.status = Status::EXCEPTION
                new_package.tracking_info.description = exception.message
                @failed_packages << new_package
            end
        end
    end
end