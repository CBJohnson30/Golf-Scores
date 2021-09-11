--- Creating Scores Tables ---

Create Table "Scores".round_info (
	round_id smallserial PRIMARY KEY,
	course_id int,
	course_tee_id int,
	course_version_id int,
	tee_played varchar(25),
	date_played date,
	weather varchar(50),
	CONSTRAINT fk_Round_Name FOREIGN KEY (course_id) REFERENCES "Courses".course_name(course_id),
	CONSTRAINT fk_Round_Version FOREIGN KEY (course_version_id) REFERENCES "Courses".course_version(course_version_id),
	CONSTRAINT fk_Round_Tee FOREIGN KEY (course_tee_id) REFERENCES "Courses".course_tee(course_tee_id)
);

Create Table "Scores".hole_scores (
	hole_score_id smallserial PRIMARY KEY,
	round_id int,
	hole_number int,
	score int,
	score_to_par int,
	FIR varchar(5),
	f_miss_side varchar(10),
	GIR varchar(5),
	g_miss_side varchar(10),
	putts int,
	note_1 varchar(25),
	note_2 varchar(25),
	CONSTRAINT FK_Scores_Round FOREIGN Key (round_id) REFERENCES "Scores".round_info(round_id)
);

Create table "Scores".note_definations (
	Note_id smallserial PRIMARY KEY,
	note varchar(25),
	note_abbv varchar(10),
	note_defination varchar(100)
);
