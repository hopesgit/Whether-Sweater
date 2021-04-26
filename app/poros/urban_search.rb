class UrbanSearch
  attr_reader :destination, :forecast, :salaries

  def initialize(salary_data, weather_data, search_term)
    @destination = search_term
    @forecast = compile_weather_data(weather_data)
    @salaries = compile_salary_data(salary_data)
  end

  def compile_weather_data(weather_data)
    {
      summary: weather_data.current_weather[:conditions],
      temperature: "#{weather.current_weather[:temperature]} F"
    }
  end

  def compile_salary_data(salary_data)
    terms = ['Data Analyst', 'Data Scientist', 'Mobile Developer', 'QA Engineer', 'Software Engineer', 'Systems Administrator', 'Web Developer']
    terms.map do |variable|

    end
  end
end
