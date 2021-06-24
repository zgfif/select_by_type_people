# frozen_string_literal: true

require 'spec_helper'

RSpec.describe QueryBuilder do
  qb = QueryBuilder.new

  it 'should correctly build request' do
    expect(qb.select('*').from('people').where({ id: '1' }).string)
      .to eq("SELECT * FROM people WHERE id='1';")
  end

  it 'should correctly build request with AND' do
    expect(qb.select('*').from('people').where({ type: 'engineer', age: '29' }).string)
      .to eq("SELECT * FROM people WHERE type='engineer' AND age='29';")
  end

  it 'should correctly build request with AND' do
    expect(qb.select('*').from('people').where({ type: 'engineer', age: '29' }).string)
      .to eq("SELECT * FROM people WHERE type='engineer' AND age='29';")
  end

  it 'should correctly build request without setting SELECT' do
    expect(qb.from('people').where({ id: '1' }).string)
      .to eq("SELECT * FROM people WHERE id='1';")
  end

  it 'should correctly build request in random order of methods' do
    expect(qb.where({ id: '1' }).from('people').select('name, age, id').string)
      .to eq("SELECT name, age, id FROM people WHERE id='1';")
  end

  it 'should correctly build with join' do
    expression = qb.select('*').from('people')
                   .join('people_groups', 'id', 'people_id', 'INNER JOIN')
                   .where({ type: 'trader' }).string

    expect(expression).to eq("SELECT * FROM people INNER JOIN people_groups ON people.id=people_groups.people_id WHERE type='trader';")
  end
end
