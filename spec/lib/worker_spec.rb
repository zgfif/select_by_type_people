require 'spec_helper'

RSpec.describe Worker do
  it 'should return proper count of workers' do
    workers = Worker.new
    expect(workers.all.count).to eq(1)
  end
end