# frozen_string_literal: true

require_relative '../database'
require_relative '../query_builder'

# this class is used to retrive id, name and type from people-table by certain type
class People
  attr_reader :builder, :db

  def initialize
    @db = Database.new
    @builder = QueryBuilder.new
  end

  def all
    db_query from_people.where(type).string
  end

  def find(id)
    condition = type.merge({ id: id })
    db_query(from_people.where(condition).string).first
  end

  def join_all
    query_str = from_people.where(type)
                           .join('people_groups', 'id', 'people_id', 'LEFT JOIN')
                           .string

    db_query(query_str)
  end

  private

  def from_people
    builder.from('people')
  end

  def db_query(str)
    db.query(str).to_a
  end

  def type
    { type: self.class.to_s.downcase }
  end
end
