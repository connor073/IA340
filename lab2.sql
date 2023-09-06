-- Create schemas

-- Create tables
CREATE TABLE IF NOT EXISTS professor
(
    p_email VARCHAR(50) NOT NULL,
    p_name VARCHAR(50) NOT NULL,
    office VARCHAR(20) NOT NULL UNIQUE,
    PRIMARY KEY(p_email)
);

CREATE TABLE IF NOT EXISTS student
(
    s_email VARCHAR(50) NOT NULL,
    s_name VARCHAR(50) NOT NULL,
    major VARCHAR(20) NOT NULL,
    PRIMARY KEY(s_email)
);

CREATE TABLE IF NOT EXISTS course
(
    c_number VARCHAR(50) NOT NULL,
    c_name VARCHAR(50) NOT NULL,
    room VARCHAR(20) NOT NULL,
    p_email VARCHAR(50) NOT NULL,
    PRIMARY KEY(c_number)
);

CREATE TABLE IF NOT EXISTS enroll
(
    s_email VARCHAR(50) NOT NULL,
    c_number VARCHAR(50) NOT NULL,
    PRIMARY KEY(s_email, c_number)
);


-- Create FKs
ALTER TABLE professor
    ADD    FOREIGN KEY (p_email)
    REFERENCES course(p_email)
    MATCH SIMPLE
;
    
ALTER TABLE enroll
    ADD    FOREIGN KEY (c_number)
    REFERENCES student(s_email)
    MATCH SIMPLE
;
    
ALTER TABLE course
    ADD    FOREIGN KEY (c_number)
    REFERENCES enroll(s_email)
    MATCH SIMPLE
;
    

-- Create Indexes

