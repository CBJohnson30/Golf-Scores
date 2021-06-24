--- Creating courses tables ---

-- course_info table is used to store course/tee infromation --
Create TABLE "Courses".course_info (
	course_info_id smallserial primary key,
	course_id varchar(5),
	par varchar(3),
	tee varchar(25),
	total_distance int,
	f9_distance int,
	b9_distance int,
	rating numeric,
	slope int,
	course_version_id varchar(5)
);

-- hole_info contains infromation about each whole by course/course_id/tee --
Create TABLE "Courses".hole_info (
	hole_info_id smallserial primary key,
	course_id varchar(5),
	course_version_id varchar(5),
	tee varchar (25),
	hole varchar(5),
	par varchar(5),
	distance int,
	handicap int
);

-- course_version is needed in case a course ever updates its layout or rating -- 
Create Table "Courses".course_version (
	course_version_id smallserial primary key,
	course_id varchar(5),
	reason_added varchar(50),
	date_added date
);

-- course_name stores meta-data and background infromation about each course. 
Create Table "Courses".course_name (
	course_id smallserial primary key,
	course_name varchar(50),
	city varchar(50),
	state varchar(25),
	zip_code varchar(5),
	address varchar(100),
	date_added date
);


