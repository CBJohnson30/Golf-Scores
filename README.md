# Golf-Scores

This Repo will go over a project that is centered around collecting and analyzing data created from playing golf. This will not only contain overall golf scores but more detailed information about courses and each hole. All information will be entered through jupyter notebooks and stored locally in a Postgres database. The goal is to be able to collect and analyze the data around the golf rounds that I want to analyze. 

## Background

This project started with me wanting to analyze my golf rounds. My first thought was to piggyback off of other applications that are already created to keep golf scores. There are quite a few of these apps that not only let you keep the score on your phone but your smartwatch as well. A lot of these apps kept and tracked all of the information I wanted but none of them had an advertised API to be able to pull down your data. I emailed or filled out the 'Contact Us' sections to ask if they had an API that I could use to pull down my information. I got a few responses back but, they all said 'No' in so many words, and some did not get back to me at all. This left me with no other option but to build a collection process myself. 

## Database

The data is stored locally in a Postgres database. I picked this over storing it in the cloud because of the analysis component in the future(I want to test out a few different analysis applications and their tree trials do not include cloud connection access). This also allowed me to easily update and experiment with the database and tweak small things throughout of coding process. Also, it does not hurt that I do not have to pay for the cloud space as well. 

The database itself is divided into two schemas, Courses and Scores. Courses contains four different tables, 'course_name', 'course_version', 'course_info', and 'hole_info'. This schema contains all information about each course that I played. 

![courses_schema](https://github.com/CBJohnson30/Golf-Scores/blob/main/Images/courses_schema.png)

The other schema, 'Scores' contains all information around each round I played and data about each hole in every round. These tables are called 'round_info' and 'hole_scores'.
 
![scores_schema](https://github.com/CBJohnson30/Golf-Scores/blob/main/Images/scores_schema.png)

## Data Entry

All data entry is done through jupyter notebooks and the Ipywidgets package. Ipywidgets lets me build a visual front end to easily enter the needed data while also saving it as variables to use later on in the notebook. This package also lets me enter data in multiple ways; by dates, strings, integers, or floats. This package lets me do everything I need when it comes to data entry. Below is a screen of what date entry looks for one hole.

![hole_score](https://github.com/CBJohnson30/Golf-Scores/blob/main/Images/hole_score.png)

## Analysis

The next step of this project will be an analysis of my golf stats. I need to play a few courses a couple of more times to be able to gather insight on each course specificity but that will come with time. These are a few questions I am going to start off answering but I am hoping to add to this list as I continue with this project:
- What course do I hit the most fairways/greens on?
- Are there any patterns in shooting at or below my current handicap? 
- What distance of course/hole per par do play best?
- What side do I miss most of my fairways/greens and is this course-specific? 
