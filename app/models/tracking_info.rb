class TrackingInfo < Struct.new(:id,:status, :address)
    attr_accessor :events
end
