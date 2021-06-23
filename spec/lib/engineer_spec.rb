# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Engineer do
  it 'should return 2 engineers' do
      engineers = Engineer.new
      expect(engineers.all.count).to eq(2)
  end
end
