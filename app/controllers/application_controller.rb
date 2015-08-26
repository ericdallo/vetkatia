class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    include SessionsHelper

    def respond_modal_with(*args, &blk)
        options = arg   s.extract_options!
        options[:responder] = ModalResponder
        respond_with *args, options, &blk
    end

    def page_not_found
        respond_to do |format|
            format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
            format.all  { render nothing: true, status: 404 }
        end
    end

    def server_error
        respond_to do |format|
            format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
            format.all  { render nothing: true, status: 500}
        end
    end

end
