class TrackingController < ApplicationController

    #GET /carrier/:name/tracking/:numbers
    def show
        errors = []
        status = :ok
        packages = []
        begin
            carrier = FCarrier.new.select_by_name(params[:name])
            carrier.set_connection()
            carrier.obtein_tracking_info(params[:numbers])
            packages, errors = carrier.get_packages
        rescue => exception
            errors << exception.message
            status = :internal_server_error #TODO Errors module to customize an error handler
        end

        render :json => response_json(packages,errors), :status => status
    end

    private

    def response_json(result,errors)
        {
            result: result,
            errors: errors
        }
    end
end
