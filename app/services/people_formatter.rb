require_relative 'application_service'
require_relative '../models/person'
require_relative '../decorators/person_decorator'
class PeopleFormatter < ApplicationService
    def initialize(data_to_format)
        @data_to_format = data_to_format
    end
    
    def call()
        formatted_data = []
        separators = {dollar: "$", percent: "%" }
        @data_to_format[:to_format].each do |data|
            separator = separators[data[:format].to_sym]
            lines = data[:value].split("\n")
            positions = {}
            header = lines[0].split(" #{separator} ")
            header.each_index{|index| positions[header[index]] =  index}
            for i in 1 .. lines.size  - 1
                data = lines[i].split(" #{separator} ")
                person = {}
                positions.each{|k, v| person[k] = data[v] }
                formatted_data << Person.new(person)
            end
        end
        formatted_data.sort_by { |person| person.send(@data_to_format[:order].to_s) }.map{|person| PersonDecorator.new(person).format}
    end
end