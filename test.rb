require 'mysql2'
require 'yaml'
require_relative 'classes'

#db = DB.new
#b = QueryBuilder.new

#str = b.select('id,name').from('people').where(:id=>1,:type=>'student').get('people')

#db.query(str).each do  |row|
#p row
#end



 stud = Student.new
stud.all

teach = Teacher.new
teach.all
	
