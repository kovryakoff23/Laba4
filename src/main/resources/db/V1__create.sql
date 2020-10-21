CREATE SEQUENCE public.Courses_id
    INCREMENT 1
    START 0
    MINVALUE 0
    MAXVALUE 9999;

CREATE TABLE Courses (
    Courses_id bigint NOT NULL,
    Name char[],
    Number_hours integer,
    CONSTRAINT Courses_primary_key PRIMARY KEY (Courses_id)
        INCLUDE(Courses_id)
);

CREATE SEQUENCE public.Teacher_id
    INCREMENT 1
    START 0
    MINVALUE 0
    MAXVALUE 9999;

CREATE TABLE Teacher (
    Teacher_id bigint NOT NULL,
    Name char[],
    Surname char,
    Age integer ,
    Course_id integer,
    CONSTRAINT Teacher_primary_key PRIMARY KEY (Teacher_id)
        INCLUDE(Teacher_id),
    CONSTRAINT Courses_id FOREIGN KEY (Courses_id)
        REFERENCES public.Courses (Courses_id)  MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE SEQUENCE public.Students_id
    INCREMENT 1
    START 0
    MINVALUE 0
    MAXVALUE 9999;

CREATE TABLE public.Students (
    Student_id bigint NOT NULL,
    Name char[],
    Surname char[],
    Taken boolean,
    CONSTRAINT Student_primary_key PRIMARY KEY (Student_id)
        INCLUDE(Students_id),
);


CREATE SEQUENCE public.Taken_id
    INCREMENT 1
    START 0
    MINVALUE 0
    MAXVALUE 9999;

CREATE TABLE public.Student_taken (
    Taken_id bigint NOT NULL,
    Student_id bigint NOT NULL,
    Course_id bigint NOT NULL,
    CONSTRAINT Taken_primary_key PRIMARY KEY (Taken_id)
            INCLUDE(Taken_id)
);

CREATE TABLE public.Marks (
    Date date,
    Taken_id bigint NOT NULL,
    Mark_homework integer,
    Attending boolean,
    CONSTRAINT Marks_pkey PRIMARY KEY (Taken_id),
    CONSTRAINT Taken_id FOREIGN KEY (Taken_id) REFERENCES public.Student_taken(Taken_id)   MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE public.Schedule (
    Course_id bigint,
    Teacher_id bigint,
    Data date,
    CONSTRAINT Schedule_primary_key PRIMARY KEY (Data, Course_id),
    CONSTRAINT Course_id FOREIGN KEY (Course_id) REFERENCES public.Courses(Courses_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT Teacher_id FOREIGN KEY (Teacher_id) REFERENCES public.Teacher(Teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);