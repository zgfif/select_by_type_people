# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Worker do
  workers = Worker.new

  it 'should return proper count of workers' do
    expect(workers.all.count).to eq(1)
  end

  it 'should return worker by id' do
    expect(workers.find(1).count).to eq(0)
  end

  it 'should return worker by id' do
    expect(workers.find(2).count).to eq(1)
  end

  it 'should return with group id' do
    result = workers.join_all
    expect(result.first['group_id']).to eq(2)
    expect(result.count).to eq(1)
  end
end
