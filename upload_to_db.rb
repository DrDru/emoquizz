require 'pg'

conn = PG.connect(host: "localhost", port: 5432,  dbname: 'quizzprod', user: 'postgres', password: "admin")
res = conn.exec('select *  from emoquestions')


conn.exec('drop table if exist definitions')


conn.exec("create table definitions (

	    id serial PRIMARY KEY,
        entry varchar (20) NOT NULL)
        ;

    INSERT INTO definitions (entry) VALUES ('猿');
    INSERT INTO definitions (entry) VALUES ('食べる');
    INSERT INTO definitions (entry) VALUES ('ねずみ');


	")



