-- Creating procedure to enter data into course_name and course_version tables
Create PROCEDURE "Courses".add_new_course(
	p_course_name varchar,
	p_city varchar,
	p_state varchar,
	p_zip_code varchar,
	p_address varchar,
	p_date_added date,
	p_reason_added varchar
)
AS $$
DECLARE
    v_course_id int;
-- Checking is course is already in table, if so grabbing course_id
BEGIN
	Select course_id from "Courses".course_name where course_name = p_course_name
	into v_course_id;

-- Incerting data into tables
    If (v_course_id is null) then
	BEGIN
        INSERT INTO "Courses".course_name(course_name, city, state, zip_code, address, date_added)
        values (p_course_name, p_city, p_state, P_zip_code, p_address, p_date_added)
		returning course_id into v_course_id;
	END;
	END IF;
	
    INSERT into "Courses".course_version(course_id, reason_added, date_added)
    values (v_course_id, p_reason_added, p_date_added);
      
 END;
 $$
 LANGUAGE PLPGSQL;

-- Creating procedure to enter data into course_tee and hole_info tables
 Create PROCEDURE "Courses".add_new_course_tee(
	p_course_id int,
	p_total_par int,
	p_tee varchar,
	p_total_distance int,
	p_f9_distance int,
	p_b9_distance int,
	p_rating numeric,
	p_slope int,
	p_course_version_id int,
	p_hole int,
	p_par int,
	p_distance int,
	p_handicap int
)
AS $$
DECLARE
    v_course_tee_id int;
-- Checking is course is already in table, if so grabbing course_tee_id
Begin
	Select course_tee_id from "Courses".course_tee where course_id = p_course_id and tee = p_tee
	into v_course_tee_id;
-- Incerting data into tables
    If (v_course_tee_id is null) then
	BEGIN
        INSERT INTO "Courses".course_tee(course_id, total_par, tee, total_distance, f9_distance, b9_distance, rating, slope, course_version_id)
        values (p_course_id, p_total_par, p_tee, p_total_distance, p_f9_distance, p_b9_distance, p_rating, p_slope, p_course_version_id)
        RETURNING course_tee_id into v_course_tee_id;
    END;
	END IF;

    INSERT into "Courses".hole_info(course_id, course_version_id, course_tee_id, tee, hole, par, distance, handicap)
    values (p_course_id, p_course_version_id, v_course_tee_id, p_tee, p_hole, p_par, p_distance, p_handicap);
      
 END;
 $$
 LANGUAGE PLPGSQL;

-- Creating procedure to enter data into round_info and hole_scores tables
 Create PROCEDURE "Scores".add_new_round(
    p_course_id int,
    p_course_version_id int,
    p_course_tee_id int,
    p_tee_played varchar,
    p_date_played date,
    p_weather varchar,
    p_hole_number int,
    p_score int,
	p_score_to_par int,
	p_FIR varchar,
	p_f_miss_side varchar,
	p_GIR varchar,
	p_g_miss_side varchar,
	p_putts int,
	p_note_1 varchar,
	p_note_2 varchar
)
AS $$
DECLARE
    v_round_id int;
-- Checking is course is already in table, if so grabbing round_id
Begin
	Select round_id from "Scores".round_info where date_played = p_date_played and course_id = p_course_id
	into v_round_id;
-- Incerting data into tables
    If (v_round_id is null) then
    BEGIN
        INSERT into "Scores".round_info(course_id, course_version_id, course_tee_id, tee_played, date_played, weather)
        values (p_course_id, p_course_version_id, p_course_tee_id, p_tee_played, p_date_played, p_weather)
        RETURNING round_id INTO v_round_id;
    END;
	END IF;
	
    INSERT INTO "Scores".hole_scores(round_id, hole_number, score, score_to_par, FIR, f_miss_side, GIR, g_miss_side, putts, note_1, note_2)
    values (v_round_id, p_hole_number, p_score, p_score_to_par, p_FIR, p_f_miss_side, p_GIR, p_g_miss_side, p_putts, p_note_1, p_note_2);
 END;
 $$
 LANGUAGE PLPGSQL;