# frozen_string_literal: true

require_relative '../database'
require_relative '../query_builder'


# this class is used to retrive id, name and type from people-table by certain type
class People
	attr_reader :type

	def initialize(type)
		@type = type
		@db = Database.new
		@builder = QueryBuilder.new
	end

	def all
		@db.query(build_request).to_a
	end

	private

	def build_request
		@builder.select('id, name, type').from('people').where({ type: type }).get_string
	end
end
