# frozen_string_literal: true

require_relative './people'

# this class is used to retrive all people by type 'worker'

class Worker < People
	def initialize(type = 'worker')
		super
	end
end
