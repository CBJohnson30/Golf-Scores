--- Creating courses tables ---
Create Table "Courses".course_name (
	course_id smallserial PRIMARY KEY,
	course_name varchar(50),
	city varchar(50),
	state varchar(25),
	zip_code varchar(5),
	address varchar(100),
	date_added date
);

Create Table "Courses".course_version (
	course_version_id smallserial PRIMARY KEY,
	course_id  int,
	reason_added varchar(50),
	date_added date,
	CONSTRAINT fk_Version_Name FOREIGN KEY (course_id) REFERENCES "Courses".course_name(course_id)
);

Create TABLE "Courses".course_tee (
	course_tee_id smallserial PRIMARY KEY,
	course_id int,
	total_par int,
	tee varchar(25),
	total_distance int,
	f9_distance int,
	b9_distance int,
	rating numeric,
	slope int,
	course_version_id int,
	CONSTRAINT fk_Tee_Name FOREIGN KEY (course_id) REFERENCES "Courses".course_name(course_id),
	CONSTRAINT fk_Tee_Version FOREIGN KEY (course_version_id) REFERENCES "Courses".course_version(course_version_id)
);

Create TABLE "Courses".hole_info (
	hole_info_id smallserial PRIMARY KEY,
	course_id int,
	course_version_id int,
	course_tee_id int,
	tee varchar(25),
	hole int,
	par int,
	distance int,
	handicap int,
	CONSTRAINT fk_Hole_Name FOREIGN KEY (course_id) REFERENCES "Courses".course_name(course_id),
	CONSTRAINT fk_Hole_Version FOREIGN KEY (course_version_id) REFERENCES "Courses".course_version(course_version_id),
	CONSTRAINT fk_Hole_Tee FOREIGN KEY (course_tee_id) REFERENCES "Courses".course_tee(course_tee_id)
);






