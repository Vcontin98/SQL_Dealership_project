CREATE TABLE "car" (
	"car_id" serial NOT NULL,
	"sales_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"vin" varchar(17) NOT NULL UNIQUE,
	"make" varchar(255) NOT NULL,
	"model" varchar(255) NOT NULL,
	"year" integer NOT NULL,
	CONSTRAINT "car_pk" PRIMARY KEY ("car_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "salesperson" (
	"sales_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "salesperson_pk" PRIMARY KEY ("sales_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "customer" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "invoice" (
	"invoice_id" serial NOT NULL,
	"sales_id" integer NOT NULL,
	"car_id" integer NOT NULL,
	"customer_id" integer NOT NULL,
	"total" integer NOT NULL,
	CONSTRAINT "invoice_pk" PRIMARY KEY ("invoice_id")
) WITH (
  OIDS=FALSE
);

alter table invoice
alter column car_id set data type integer;


CREATE TABLE "service_history" (
	"service_history_id" serial NOT NULL,
	"car_id" integer NOT NULL,
	"service_ticket_id" integer NOT NULL,
	CONSTRAINT "service_history_pk" PRIMARY KEY ("service_history_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "mechanic" (
	"mechanic_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	CONSTRAINT "mechanic_pk" PRIMARY KEY ("mechanic_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "part" (
	"part_id" serial NOT NULL,
	"part_name" varchar(255) NOT NULL,
	CONSTRAINT "part_pk" PRIMARY KEY ("part_id")
) WITH (
  OIDS=FALSE
);

alter table part
alter column part_name set data type varchar(255);

CREATE TABLE "service_mechanic" (
	"service_mechanic_id" serial NOT NULL,
	"service_ticket_id" integer NOT NULL,
	"mechanic_id" integer NOT NULL,
	CONSTRAINT "service_mechanic_pk" PRIMARY KEY ("service_mechanic_id","service_ticket_id","mechanic_id")
) WITH (
  OIDS=FALSE
);

alter table service_mechanic
alter column service_ticket_id  set data type integer;




CREATE TABLE "service_ticket" (
	"service_ticket_id" serial NOT NULL,
	"invoice_id" integer NOT NULL,
	"part_id" integer NOT NULL,
	CONSTRAINT "service_ticket_pk" PRIMARY KEY ("service_ticket_id")
) WITH (
  OIDS=FALSE
);

ALTER TABLE "car" ADD CONSTRAINT "car_fk0" FOREIGN KEY ("sales_id") REFERENCES "salesperson"("sales_id");
ALTER TABLE "car" ADD CONSTRAINT "car_fk1" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "invoice" ADD CONSTRAINT "invoice_fk0" FOREIGN KEY ("sales_id") REFERENCES "salesperson"("sales_id");
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_fk1" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");
ALTER TABLE "invoice" ADD CONSTRAINT "invoice_fk2" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "service_history" ADD CONSTRAINT "service_history_fk0" FOREIGN KEY ("car_id") REFERENCES "car"("car_id");
ALTER TABLE "service_history" ADD CONSTRAINT "service_history_fk1" FOREIGN KEY ("service_ticket_id") REFERENCES "service_ticket"("service_ticket_id");

ALTER TABLE "service_mechanic" ADD CONSTRAINT "service_mechanic_fk0" FOREIGN KEY ("service_ticket_id") REFERENCES "service_ticket"("service_ticket_id");
ALTER TABLE "service_mechanic" ADD CONSTRAINT "service_mechanic_fk1" FOREIGN KEY ("mechanic_id") REFERENCES "mechanic"("mechanic_id");

ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk0" FOREIGN KEY ("invoice_id") REFERENCES "invoice"("invoice_id");
ALTER TABLE "service_ticket" ADD CONSTRAINT "service_ticket_fk1" FOREIGN KEY ("part_id") REFERENCES "part"("part_id");
