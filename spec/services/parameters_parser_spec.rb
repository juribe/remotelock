RSpec.describe 'ParametersParse' do
    describe 'get right information from parameters' do
        it 'should return right data' do
            parameters = {
                percent_format: File.read('spec/fixtures/people_by_percent.txt'),
                order: :first_name,
              }
            format_parameters = ParametersParser.call(parameters)
            expect(format_parameters).to eq({:order=>:first_name,
            :to_format=>
             [{:format=>"percent",
               :value=>
                "first_name % city % birthdate\n" +
                "Mckayla % Atlanta % 1986-05-29\n" +
                "Elliot % New York City % 1947-05-04\n"}]})
        end
    end
end