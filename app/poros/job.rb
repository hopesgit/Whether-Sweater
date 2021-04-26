class Job
  attr_reader :title, :min, :max
  def initialize(salary_data)
    @title = salary_data[:job][:title]
    @min = "$#{salary_data[:salary_percentiles][:percentile_75].floor(2)}"
    @max = "$#{salary_data[:salary_percentiles][:percentile_25].floor(2)}"
  end
end
