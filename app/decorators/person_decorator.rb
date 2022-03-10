require 'date'
class PersonDecorator
    def initialize(person)
        @person = person
    end

    def format
        "#{@person.first_name}, #{find_city}, #{format_birthdate}"
    end

    def find_city
        cities = {LA: "Los Angeles",NYC: "New York City"}
        cities[@person.city.to_sym] || @person.city
    end

    def format_birthdate
        Date.parse(@person.birthdate).strftime("%-m/%-d/%Y")
    end

end