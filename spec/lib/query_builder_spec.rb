require 'spec_helper'

RSpec.describe QueryBuilder do
  qb = QueryBuilder.new

  it 'should correctly build request' do
    expect(qb.select('*').from('people').where({ id: '1' }).get_string)
      .to eq("SELECT * FROM people WHERE id='1';")
  end

  it 'should correctly build request with AND' do
    expect(qb.select('*').from('people').where({ type: 'engineer', age: '29' }).get_string)
    .to eq("SELECT * FROM people WHERE type='engineer' AND age='29';")
  end

  it 'should correctly build request with AND' do
    expect(qb.select('*').from('people').where({ type: 'engineer', age: '29' }).get_string)
    .to eq("SELECT * FROM people WHERE type='engineer' AND age='29';")
  end

  it 'should correctly build request without setting SELECT' do
    expect(qb.from('people').where({ id: '1' }).get_string)
    .to eq("SELECT * FROM people WHERE id='1';")
  end

  it 'should correctly build request in random order of methods' do
    expect(qb.where({ id: '1' }).from('people').select('name, age, id').get_string)
    .to eq("SELECT name, age, id FROM people WHERE id='1';")
  end
end
