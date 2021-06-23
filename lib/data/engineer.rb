# frozen_string_literal: true

require_relative './people'

# this class is used to retrive all people by type 'engineer'

class Engineer < People
	def initialize(type = 'engineer')
		super
	end
end
