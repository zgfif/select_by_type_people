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
    str = from_people.where(type).string
    db_query(str)
  end

  def find(id)
    str = from_people.where(type.merge({ id: id })).string
    db_query(str)
  end

  def join_all
    str = from_people.where(type)
                     .join('people_groups', 'id', 'people_id', 'LEFT JOIN')
                     .string

    db_query(str)
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
