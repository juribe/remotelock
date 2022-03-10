RSpec.describe 'PersonDecorator' do
    describe 'makes format' do
        it 'should render right city name using diminutive' do
            person_decorator = PersonDecorator.new(Person.new({city: "LA", birthdate: "30-4-1974", 
            last_name: "Nolan", first_name: "Rhiannon"}))
            person_format = person_decorator.format
            expect(person_format).to eq("Rhiannon, Los Angeles, 4/30/1974")
        end
        it 'should render right city name using complete name' do
            person_decorator = PersonDecorator.new(Person.new({city: "Los Angeles", birthdate: "30-4-1974", 
            last_name: "Nolan", first_name: "Rhiannon"}))
            person_format = person_decorator.format
            expect(person_format).to eq("Rhiannon, Los Angeles, 4/30/1974")
        end
        it 'should render right birthdate using different format' do
            person_decorator = PersonDecorator.new(Person.new({city: "Los Angeles", birthdate: "1986-05-29", 
            last_name: "Nolan", first_name: "Rhiannon"}))
            person_format = person_decorator.format
            expect(person_format).to eq("Rhiannon, Los Angeles, 5/29/1986")
        end
    end
end