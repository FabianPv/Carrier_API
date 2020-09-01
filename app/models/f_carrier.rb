class FCarrier

    def select_by_name(carrier)
        carrier = Carrier.active.find_by(name: carrier)
        if  !carrier.nil? && Kernel.const_defined?(carrier.model)
            carrier.becomes(Object::const_get(carrier.model))
        else
            raise "Unavailable carrier"
        end
    end
end
