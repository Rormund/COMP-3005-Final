CREATE TABLE "Admin Staff" (
	admin_id serial PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL
);

CREATE TABLE Members (
	member_id serial PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL
);

CREATE TABLE Trainers (
	trainer_id serial PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL
);

CREATE TABLE "Fitness Goals" (
	member_id serial PRIMARY KEY REFERENCES Members(member_id),
	goal_title TEXT NOT NULL,
	end_date DATE NOT NULL,
	initial_value TEXT NOT NULL,
	goal_value TEXT NOT NULL
);

CREATE TABLE Metrics (
	member_id serial PRIMARY KEY REFERENCES Members(member_id),
	weight TEXT,
	age INT,
	bmi INT,
	daily_calories INT,
	bodyfat_percent INT
);

CREATE TABLE "Health Stats" (
	member_id serial PRIMARY KEY REFERENCES Members(member_id),
	date_of_entry DATE NOT NULL DEFAULT CURRENT_DATE,
	weight INT,
	age INT,
	bmi INT,
	bodyfat_percent INT
);

CREATE TABLE "Room Booking"(
	booking_id serial PRIMARY KEY,
	room_number INT NOT NULL,
	date DATE NOT NULL,
	time TEXT NOT NULL
);

CREATE TABLE "Class Schedule"(
	booking_id serial PRIMARY KEY REFERENCES "Room Booking"(booking_id),
	date DATE NOT NULL,
	room_number INT NOT NULL,
	event_name TEXT NOT NULL,
	time TEXT NOT NULL
);

CREATE TABLE "Trainer Schedule"(
	trainer_id serial PRIMARY KEY REFERENCES Trainers(trainer_id),
	days_off TEXT[] NOT NULL,
	available_times TEXT[] NOT NULL
);

CREATE TABLE "Trainer Booking"(
	trainer_id serial REFERENCES Trainers(trainer_id),
	member_id serial REFERENCES Members(member_id),
	confirmation_number serial PRIMARY KEY,
	date DATE NOT NULL,
	timeslot TEXT NOT NULL
);

CREATE TABLE Billing(
	billing_id serial PRIMARY KEY,
	member_id serial REFERENCES Members(member_id),
	date_due DATE NOT NULL,
	amount NUMERIC(7,5) NOT NULL,
	status TEXT NOT NULL
);

CREATE TABLE "Equipment Maintenance" (
	equipment_id serial PRIMARY KEY,
	admin_id serial REFERENCES "Admin Staff"(admin_id),
	equipment_name TEXT NOT NULL,
	purchase_date DATE NOT NULL,
	last_checked DATE NOT NULL,
	next_check DATE NOT NULL
);