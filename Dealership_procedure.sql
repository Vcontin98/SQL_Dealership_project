CREATE OR REPLACE PROCEDURE addCustomer
    (
        _first_name varchar(255),
        _last_name varchar(255)         
    )
    
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO customer (
        first_name,
        last_name
    
    )VALUES (
        _first_name,
        _last_name
    
    );
    
END;
$$

CALL addCustomer('Matt', 'Whisman');
CALL addCustomer('Victor', 'Contin');
CALL addCustomer('Meilani', 'Nishimura');

select * from customer

Create OR REPLACE PROCEDURE addSalesperson (
	_first_name varchar(255),
	_last_name varchar(255)
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	salesperson(first_name, last_name)
VALUES
	(_first_name,
	_last_name
	);
END;
$$

CALL addSalesperson('Joe', 'Schmoe');
CALL addSalesperson('Sally', 'Johnson');
CALL addSalesperson('Billy', 'Madison');

select * from salesperson

Create OR REPLACE PROCEDURE addCar (
	_sales_id INTEGER,
	_customer_id INTEGER,
	_vin varchar(17),
	_make varchar(255),
	_model varchar(255),
	_year INTEGER
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	car(sales_id, customer_id, vin, make, model, year)
VALUES
	(_sales_id,
	_customer_id,
	_vin,
	_make,
	_model,
	_year
	);
END;
$$
CALL addCar(1, 2, 'FSDA324238DFSD8d9', 'Ford', 'F150', 2022);
CALL addCar(2, 3, 'FSDA3djsk8DFSD8d9', 'Tesla', 'Cybertruck', 2023);
CALL addCar(3, 1, 'FSDjdk3828DFSD8d9', 'Dodge', 'Challenger', 2020);

select * from car

Create OR REPLACE PROCEDURE addInvoice (
	_sales_id INTEGER,
	_car_id INTEGER,
	_customer_id INTEGER,
	_total NUMERIC
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	invoice(sales_id, car_id, customer_id, total)
VALUES
	(_sales_id,
	_car_id,
	_customer_id,
	_total
	);
END;
$$

CALL addInvoice(2, 1, 1, 500.37);
CALL addInvoice(3, 3, 2, 1000.99);
CALL addInvoice(1, 2, 3, 647.23);

select * from invoice

Create OR REPLACE PROCEDURE addPart (
	_part_name varchar(255)
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	part(part_name)
VALUES
	(_part_name);
END;
$$

CALL addPart('NOS - Fast and Furious Variety');
CALL addPart('Muffler');
CALL addPart('Big Tires');

select * from part

Create OR REPLACE PROCEDURE addMechanic (
	_first_name varchar(255),
	_last_name varchar(255)
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	mechanic(first_name, last_name)
VALUES
	(
		_first_name,
		_last_name
	);
END;
$$

CALL addMechanic('Larry', 'Bigdog');
CALL addMechanic('Joe', 'Fixem');
CALL addMechanic('Sue', 'Yew');

select * from mechanic

Create OR REPLACE PROCEDURE addServiceTicket (
	_invoice_id integer,
	_part_id integer
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	service_ticket(invoice_id, part_id)
VALUES
	(
		_invoice_id,
		_part_id
	);
END;
$$

CALL addServiceTicket(3, 1);
CALL addServiceTicket(1, 2);
CALL addServiceTicket(2, 3);

select * from service_ticket

Create OR REPLACE PROCEDURE addServiceMechanic (
	_service_ticket_id integer,
	_mechanic_id integer
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	service_mechanic(service_ticket_id, mechanic_id)
VALUES
	(
		_service_ticket_id,
		_mechanic_id
	);
END;
$$
CALL addServiceMechanic(2, 1);
CALL addServiceMechanic(1, 3);
CALL addServiceMechanic(3, 2);
select * from service_mechanic

Create OR REPLACE PROCEDURE addServiceHistory (
	_car_id integer,
	_service_ticket_id integer
) LANGUAGE plpgsql AS $$ BEGIN
INSERT INTO
	service_history(car_id, service_ticket_id)
VALUES
	(
		_car_id,
		_service_ticket_id
	);
END;
$$

CALL addServiceHistory(1, 2);
CALL addServiceHistory(2, 3);
CALL addServiceHistory(3, 1);

select * from service_history









