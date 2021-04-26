require 'rails_helper'

describe Job do
  before do
    @job = Job.new({
      job: {
        title: "Tree Cutter"
      },
      salary_percentiles: {
        percentile_75: 56435435.1354354,
        percentile_25: 46846043.13546574
      }
      })
  end

  it 'title' do
    expect(@job.title).to eq "Tree Cutter"
  end

  it 'min' do
    expect(@job.min).to eq "$46846043.13"
  end

  it 'max' do
    expect(@job.max).to eq "$56435435.13"
  end
end
