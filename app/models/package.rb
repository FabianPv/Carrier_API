class Package < Struct.new(:id,:tracking_info)

    def tracking_status=(status)
        tracking_info.status = status
    end

    def tracking_description=(description)
        tracking_info.description = description
    end

    def initialize(*args)
        super
        self.tracking_info = TrackingInfo.new()
    end
end
