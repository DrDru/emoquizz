require 'pg'

conn = PG.connect(host: "localhost", port: 5432,  dbname: 'quizz_prod', user: 'postgres', password: "admin")


require 'csv'
table = CSV.parse(File.read("C://Users/Thomas/Desktop/learn_ruby/emoquizz/questions.csv").force_encoding('utf-8'), headers: false )

conn.exec("drop table emoquestions;")

conn.exec("create table emoquestions (

	    id serial PRIMARY KEY,
        question varchar (200) NOT NULL,
		is_correct integer,
		created_at timestamp,
		updated_at timestamp
		)
        ;
		")

table.each { |elem|

 puts elem

    conn.exec("
    INSERT INTO emoquestions (question, is_correct, created_at, updated_at) VALUES ('" + elem[0] + "', " + elem[1] + " , '2020-01-01', '2020-01-01');"
    
	)
}		
		
		