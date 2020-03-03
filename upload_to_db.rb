require 'pg'

conn = PG.connect(host: "localhost", port: 5432,  dbname: 'quizz_prod', user: 'postgres', password: "admin")



require 'csv'
table = CSV.parse(File.read("C://Users/Thomas/Desktop/learn_ruby/emoquizz/questions.csv").force_encoding('utf-8'), headers: false )

conn.exec("drop table emoquestions;")

conn.exec("create table emoquestions (

	    id serial PRIMARY KEY,
        question varchar (200) NOT NULL,
		created_at timestamp,
		updated_at timestamp
		)
        ;
		")

table.each { |elem|

    conn.exec("
    INSERT INTO emoquestions (question, created_at, updated_at) VALUES ('" + elem[0] + "' , '2020-01-01', '2020-01-01');"
    
	)
	#puts elem
	#puts 'a'
	#puts elem[1]
	#puts 'b'
   #puts "INSERT INTO emoquestions (question, created_at, updated_at) VALUES (" + elem[0] + ", '2020-01-01', '2020-01-01');"
}		
		
		