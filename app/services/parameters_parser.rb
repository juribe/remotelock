require_relative 'application_service' 
class ParametersParser < ApplicationService
    def initialize(params)
        @params = params
    end
    
    def call()
        data_to_process = {order: "", to_format: []}
        @params.each do |param|
            param_string = param[0].to_s
            if param_string.end_with? "_format"
                data_to_process[:to_format] << {format: param_string.gsub("_format",""), value: param[1]}
            elsif param_string == "order"
                data_to_process[:order] = param[1]
            end
        end
        data_to_process
    end
end