# frozen_string_literal: true

# qb = QueryBuilder.new
# qb.select('*').from('people').where(id: '1').get_string =>
# RESULT:
# 'SELECT * FROM people WHERE id=1;'

# this class is used to build sql request string
class QueryBuilder
  def initialize
    # defuault values
    @select = '*'
    @where = '1=1' # default true
    @from = ''
    @sql_string = ''
  end

  def select(attributes)
    @select = attributes
    self # returns instance of QueryBuilder with updated (or NOT) @select
  end

  def from(table = '')
    @from = table unless table.empty?
    self # returns instance of QueryBuilder with updated (or NOT) @from
  end

  # arguments {'name' => 'Pasha'}
  def where(params = {})
    unless params.empty?
      where = []

      params.each do |key, value|
        value = "'#{value}'" if value.instance_of?(String)
        where << "#{key}=#{value}"
      end

      @where = where.join(' AND ')
    end

    self # returns instance of QueryBuilder with updated (or NOT) @where
  end

  def string
    @sql_string = "SELECT #{@select} FROM #{@from} WHERE #{@where};"
  end
end
