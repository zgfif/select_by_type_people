require 'spec_helper'

RSpec.describe Database do
  conn = Database.new

  it 'should return invalid statement' do
    statement = 'invalid request'
    expect(conn.query(statement)).to eq('invalid statement')
  end

  it 'should return result' do
    statement = 'SELECT * FROM people;'
    expect(conn.query(statement)).to be_kind_of(Mysql2::Result)
  end
end
