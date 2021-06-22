require 'spec_helper'

RSpec.describe People do
  it 'should return all people' do
    people = People.new
    expect(people.all.count).to eq(0)
  end

  it 'should return all people' do
    people = People.new('engineer')
    expect(people.all.count).to eq(2)
  end
end
