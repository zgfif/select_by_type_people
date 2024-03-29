# frozen_string_literal: true

require 'mysql2'
require 'yaml'

# this class is used to make sql request to mysql database
# configuration is saved in config.yml
class Database
  def initialize
    @db_client = Mysql2::Client.new(YAML.load_file('config.yml')['db'])
  end

  def query(string)
    @db_client.query(string)
  rescue Mysql2::Error
    'invalid statement'
  end
end
