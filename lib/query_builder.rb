# this class is used to build sql request string,
# example:
# qb = QueryBuilder.new
# qb.select('*').from('people').where(id: '1').get_string =>
# RESULT:
# 'SELECT * FROM people WHERE id=1;'

class QueryBuilder
	def initialize
		# defuault values
		@select = '*'
		@where = '1=1' # default true
		@from = ''
		@sql_string = ''
	end

	def select(f)
		@select = f
		self # returns instance of QueryBuilder with updated (or NOT) @select
	end

	def from(table = '')
		@from = table unless table.empty?
		self # returns instance of QueryBuilder with updated (or NOT) @from
	end

	def where(params = {}) # arguments {'name' => 'Pasha'}
		 unless params.empty?
		 	 where = []

		 	 params.each do |key, value|
		 		 value = "'#{value}'" if value.class == String
		 		 where << "#{key}=#{value}"
		 	 end

		 	 @where = where.join(' AND ')
		 end

		self # returns instance of QueryBuilder with updated (or NOT) @where
	end

	def get_string
		@sql_string = "SELECT #{@select} FROM #{@from} WHERE #{@where};"
	end
end
