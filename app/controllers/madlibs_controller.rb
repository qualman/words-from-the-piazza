class MadlibsController < ApplicationController
    def index
        # TDOO: Remove error symbol if nil
        @madlib = Madlib.new
        @response = {
            error: @madlib.error,
            madlib: @madlib.madlib
        }
        @response.delete(:error) unless @response[:error]

        render json: @response.as_json
    end
end
