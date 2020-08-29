class Carrier < ApplicationRecord
    attr_accessor :connection, :packages
    has_one :access_connection_datum
    accepts_nested_attributes_for :access_connection_datum, allow_destroy: true

    scope :active, -> { where(status: "Active")}

    def initialize(*args)
        super
        @packages = []
        @connection = nil
    end

    def get_access_data_symbolized
        raise 'Missing Data access_data' if self.access_connection_datum.blank? || self.access_connection_datum.access_data.blank?
        self.access_connection_datum.access_data.symbolize_keys
    end

    def connection_stable?
        !@connection.nil?
    end

    def get_tracking_info
        
    end
end