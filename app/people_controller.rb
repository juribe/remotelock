require_relative 'services/parameters_parser.rb'
require_relative 'services/people_formatter.rb'
class PeopleController
  def initialize(params)
    @params = params
  end

  def normalize
    data_to_format = ParametersParser.call(@params)
    PeopleFormatter.call(data_to_format)
  end

  private

  attr_reader :params
end
