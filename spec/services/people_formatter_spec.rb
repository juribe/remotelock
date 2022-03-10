RSpec.describe 'PeopleFormatter' do
    describe 'get right format from data' do
        it 'should return right data' do
            parameters = {
                dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
                percent_format: File.read('spec/fixtures/people_by_percent.txt'),
                order: :first_name,
              }
            format_data = PeopleFormatter.call(ParametersParser.call(parameters))
            expect(format_data).to eq([
                'Elliot, New York City, 5/4/1947',
                'Mckayla, Atlanta, 5/29/1986',
                'Rhiannon, Los Angeles, 4/30/1974',
                'Rigoberto, New York City, 1/5/1962',
              ])
        end
        it 'should order by city' do
            parameters = {
                dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
                percent_format: File.read('spec/fixtures/people_by_percent.txt'),
                order: :city,
              }
            format_data = PeopleFormatter.call(ParametersParser.call(parameters))
            expect(format_data).to eq([
              "Mckayla, Atlanta, 5/29/1986", 
              "Rhiannon, Los Angeles, 4/30/1974", 
              "Rigoberto, New York City, 1/5/1962", 
              "Elliot, New York City, 5/4/1947"
              ])
        end
        it 'should order by birthdate' do
          parameters = {
              dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
              percent_format: File.read('spec/fixtures/people_by_percent.txt'),
              order: :city,
            }
          format_data = PeopleFormatter.call(ParametersParser.call(parameters))
          expect(format_data).to eq([
            "Mckayla, Atlanta, 5/29/1986", 
            "Rhiannon, Los Angeles, 4/30/1974", 
            "Rigoberto, New York City, 1/5/1962", 
            "Elliot, New York City, 5/4/1947"
            ])
      end
      it 'should support one format at time' do
        parameters = {
            percent_format: File.read('spec/fixtures/people_by_percent.txt'),
            order: :first_name,
          }
        format_data = PeopleFormatter.call(ParametersParser.call(parameters))
        expect(format_data).to eq([
          "Elliot, New York City, 5/4/1947", 
          "Mckayla, Atlanta, 5/29/1986"
          ])
    end
    end
end