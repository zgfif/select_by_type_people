class DB
	def initialize 
		@db_client = Mysql2::Client.new(YAML.load_file('config.yml')['db'])
	end

	def query(string)
		@db_client.query(string) 
	end	
end


class QueryBuilder 
	def initialize 
		@select = '*'
		@where ="1=1"
		@from =''
		@sql_string = ''
	end

	def select (f)
		@select = f
		self
	end

	def where (params={})
		 unless params.empty? 
		 	where= []
		 	params.each do |key, value|
		 		value= "'#{value}'" if value.class == String
		 		where << "#{key}=#{value}"
		 	end
		 	@where= where.join(' AND ')
		 end
		self
	end	

	def get (table ='')
		self.from(table) unless table.empty?
		self.get_string()
	end

	def from(table='')
		@from = table unless table.empty?
		self
	end
	def get_string
		@sql_string = "SELECT #{@select} FROM #{@from} WHERE #{@where}" 
	end 
end

class People
	attr_accessor :typed
	def initialize
		@typed = typed
	end
	def all
		build = QueryBuilder.new
		str = build.select('id,name,type').from('people').where(:type=> @typed).get('people')
		db = DB.new
		db.query(str).each do |row|
			p row
		end	
	end
end


class Student < People
	def initialize(typed = 'student')
		@typed = typed
	end

end


class Teacher < People
	def initialize(typed='teacher')
		@typed = typed
	end
end