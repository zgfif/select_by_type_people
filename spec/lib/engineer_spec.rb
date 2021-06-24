# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Engineer do
  engineers = Engineer.new

  it 'should return all engineers' do
    expect(engineers.all.count).to eq(2)
  end

  it 'should find engineer by id' do
    expect(engineers.find(4)['id']).to eq(4)
  end

  it 'should NOT find engineer by id' do
    expect(engineers.find(3)).to be_nil
  end

  it 'should return all engineers with group ids' do
    result = engineers.join_all
    expect(result.count).to eq(2)
    expect(result.first['group_id']).to eq(1)
  end
end
