CREATE TABLE IF NOT EXISTS DimDate (date_id integer primary key not null,
					 fulldate date,
					 year integer,
					 quarter integer,
					 month integer,
					 day integer,
					 is_weekend boolean,
					 day_of_week integer);
					 
CREATE TABLE IF NOT EXISTS DimCustomer (customer_id serial primary key not null,
						 first_name varchar(50),
						 last_name varchar(50),
						 email varchar(50),
						 address varchar(200),
						 address2 varchar(200),
						 district varchar(50),
						 city varchar(50),
						 postal_code varchar(10),
						 country varchar(100),
						 phone varchar(20),
						 start_date date,
						 end_date date);
		
CREATE TABLE IF NOT EXISTS DimFilm (film_id serial primary key not null,
								   title varchar(50),
								   description text,
								   release_year integer,
								   language varchar(20),
								   length smallint,
								   rating varchar(10),
								   special_features text,
								   fulltext tsvector,
								   start_date date,
								   end_date date);
						 
CREATE TABLE IF NOT EXISTS FactSale (sale_id serial primary key not null,
									date_id integer REFERENCES DimDate (date_id),
									customer_id integer REFERENCES DimCustomer (customer_id),
									film_id integer REFERENCES DimFilm (film_id),
									amount integer);