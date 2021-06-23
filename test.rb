# frozen_string_literal: true

require_relative './lib/data/engineer'
require_relative './lib/data/worker'

p Engineer.new.all
p Worker.new.all
