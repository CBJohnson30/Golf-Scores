--- Creating Scores Tables ---

-- round_info contains data on each round that was played -- 
Create Table "Scores".round_info (
	round_id smallserial primary key,
	course_id varchar(5),
	course_version_id varchar(5),
	tee_played varchar(25),
	date_played date,
	weather varchar(50)
);

-- hole_scores holds data about each hole that was played -- 
Create Table "Scores".hole_scores (
	hole_score_id smallserial primary key,
	round_id varchar(5),
	hole_number varchar(5),
	score int,
	score_to_par int,
	FIR varchar(5),
	f_miss_side varchar(10),
	GIR varchar(5),
	g_miss_side varchar(10),
	putts int,
	note_1 varchar(25),
	note_2 varchar(25)
);

-- note_definations stores info on what each type of note means -- 
Create table "Scores".note_definations (
	Note_id smallserial primary key,
	note varchar(25),
	note_abbv varchar(10),
	note_defination varchar(100)
);
