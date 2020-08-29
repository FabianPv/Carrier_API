class FCarrier

    def select_by_name(carrier)
        if  carrier = Carrier.active.find_by(name: carrier)
            begin
                carrier.becomes(Object::const_get(carrier.model))
            rescue => exception
                raise "Internal Server Error"
            end
        else
            raise "Unavailable carrier"
        end
    end
end
