# hw7-ddl.sql
## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"
# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.
# Section 1
# Drops all tables.  This section should be amended as new tables are added.
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
# ... 
SET FOREIGN_KEY_CHECKS = 1;
# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!
CREATE TABLE skills (
    skills_id int not null,
    skills_name varchar(255) not null,
    skills_description varchar(255) not null,
    skills_tag varchar(255) not null,
    skills_url varchar(255),
    skills_time_commitment int,
    primary key (skills_id)
);
# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!
INSERT INTO skills (
        skills_id,
        skills_name,
        skills_description,
        skills_tag
    )
VALUES (
        1,
        'Java Programmer',
        'Coding with Java programs',
        'Skill 1'
    ),
    (
        2,
        'Python Coding',
        'Writing Python programs',
        'Skill 2'
    ),
    (
        3,
        'Hacker',
        'Gathering information and accessing data',
        'Skill 3'
    ),
    (
        4,
        'Competitive Coding',
        'Able to write code quickly',
        'Skill 4'
    ),
    (
        5,
        'Media Creator',
        'Producing social media content',
        'Skill 5'
    ),
    (
        6,
        'Front End Developer',
        'Experience with HTML for creating websites',
        'Skill 6'
    ),
    (
        7,
        'Game Developer',
        'Specializing in creating video games',
        'Skill 7'
    ),
    (
        8,
        'Boxing Trainer',
        'Experience in coaching boxers',
        'Skill 8'
    );
# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.
CREATE TABLE people (
    people_id int NOT NULL,
    people_last_name varchar(256) NOT NULL,
    people_email varchar(256),
    people_linkedin_url varchar(256),
    people_headshot_url varchar(256),
    people_discord_handle varchar(256),
    people_brief_bio varchar(256),
    people_date_joined varchar(256) NOT NULL,
    PRIMARY KEY (people_id)
);
# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.
INSERT INTO people (
        people_id,
        people_last_name,
        people_email,
        people_linkedin_url,
        people_headshot_url,
        people_discord_handle,
        people_brief_bio,
        people_date_joined
    )
VALUES (
        1,
        'Person 1',
        'email1@example.com',
        'linkedin.com/person1',
        'headshoturl1',
        'discordhandle1',
        'Brief bio 1',
        '2023-10-01'
    ),
    (
        2,
        'Person 2',
        'email2@example.com',
        'linkedin.com/person2',
        'headshoturl2',
        'discordhandle2',
        'Brief bio 2',
        '2023-10-02'
    ),
    (
        3,
        'Person 3',
        'email3@example.com',
        'linkedin.com/person3',
        'headshoturl3',
        'discordhandle3',
        'Brief bio 3',
        '2023-10-03'
    ),
    (
        4,
        'Person 4',
        'email4@example.com',
        'linkedin.com/person4',
        'headshoturl4',
        'discordhandle4',
        'Brief bio 4',
        '2023-10-04'
    ),
    (
        5,
        'Person 5',
        'email5@example.com',
        'linkedin.com/person5',
        'headshoturl5',
        'discordhandle5',
        'Brief bio 5',
        '2023-10-05'
    ),
    (
        6,
        'Person 6',
        'email6@example.com',
        'linkedin.com/person6',
        'headshoturl6',
        'discordhandle6',
        'Brief bio 6',
        '2023-10-06'
    ),
    (
        7,
        'Person 7',
        'email7@example.com',
        'linkedin.com/person7',
        'headshoturl7',
        'discordhandle7',
        'Brief bio 7',
        '2023-10-07'
    ),
    (
        8,
        'Person 8',
        'email8@example.com',
        'linkedin.com/person8',
        'headshoturl8',
        'discordhandle8',
        'Brief bio 8',
        '2023-10-08'
    ),
    (
        9,
        'Person 9',
        'email9@example.com',
        'linkedin.com/person9',
        'headshoturl9',
        'discordhandle9',
        'Brief bio 9',
        '2023-10-09'
    ),
    (
        10,
        'Person 10',
        'email10@example.com',
        'linkedin.com/person10',
        'headshoturl10',
        'discordhandle10',
        'Brief bio 10',
        '2023-10-10'
    );
# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.
CREATE TABLE peopleskills (
    peopleskills_id int not null auto_increment,
    skills_id int not null,
    people_id int not null,
    date_acquired date not null,
    primary key (peopleskills_id),
    foreign key (skills_id) references skills(skills_id),
    foreign key (people_id) references people(people_id)
);
# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
INSERT INTO peopleskills (skills_id, people_id, date_acquired)
VALUES (1, 1, '2023-10-01'),
    (3, 1, '2023-10-01'),
    (6, 1, '2023-10-01'),
    (3, 2, '2023-10-02'),
    (4, 2, '2023-10-02'),
    (5, 2, '2023-10-02'),
    (1, 3, '2023-10-03'),
    (5, 3, '2023-10-03'),
    (3, 5, '2023-10-05'),
    (6, 5, '2023-10-05'),
    (2, 6, '2023-10-06'),
    (3, 6, '2023-10-06'),
    (4, 6, '2023-10-06'),
    (3, 7, '2023-10-07'),
    (5, 7, '2023-10-07'),
    (6, 7, '2023-10-07'),
    (1, 8, '2023-10-08'),
    (3, 8, '2023-10-08'),
    (5, 8, '2023-10-08'),
    (6, 8, '2023-10-08'),
    (2, 9, '2023-10-09'),
    (5, 9, '2023-10-09'),
    (6, 9, '2023-10-09'),
    (1, 10, '2023-10-10'),
    (4, 10, '2023-10-10'),
    (5, 10, '2023-10-10');
# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles
CREATE TABLE roles (
    roles_id int,
    roles_name varchar(256),
    sort_priority int,
    primary key (roles_id)
);
# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)
INSERT INTO roles (roles_id, roles_name, sort_priority)
VALUES (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);
# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment
CREATE TABLE peopleroles (
    peopleroles_id int not null auto_increment,
    people_id int not null,
    roles_id int not null,
    date_assigned date not null,
    primary key (peopleroles_id),
    foreign key (roles_id) references roles(roles_id),
    foreign key (people_id) references people(people_id)
);
# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer
INSERT INTO peopleroles (people_id, roles_id, date_assigned)
VALUES (1, 2, '2023-10-01'),
    -- Person 1 is Developer 
    (2, 5, '2023-10-02'),
    -- Person 2 is Boss
    (2, 6, '2023-10-02'),
    -- Person 2 is Mentor
    (3, 2, '2023-10-03'),
    -- Person 3 is Developer 
    (3, 4, '2023-10-03'),
    -- Person 3 is Team Lead 
    (4, 3, '2023-10-04'),
    -- Person 4 is Recruit 
    (5, 3, '2023-10-05'),
    -- Person 5 is Recruit 
    (6, 1, '2023-10-06'),
    -- Person 6 is Designer 
    (6, 2, '2023-10-06'),
    -- Person 6 is Developer 
    (7, 1, '2023-10-07'),
    -- Person 7 is Designer 
    (8, 1, '2023-10-08'),
    -- Person 8 is Designer 
    (8, 4, '2023-10-08'),
    -- Person 8 is Team Lead 
    (9, 2, '2023-10-09'),
    -- Person 9 is Developer 
    (10, 1, '2023-10-10'),
    -- Person 10 is Designer 
    (10, 2, '2023-10-10');
-- Person 10 is Developer