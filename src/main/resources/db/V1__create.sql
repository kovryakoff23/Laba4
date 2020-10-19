CREATE TABLE Courses (
    Courses_id bigint NOT NULL,
    Name char[],
    Number_hours integer
    CONSTRAINT Courses_primary_key PRIMARY KEY (Courses_id);
);

CREATE TABLE Teacher (
    Teacher_id bigint NOT NULL,
    Name char[],
    Surname char,
    Age integer char[],
    Course_id integer
    CONSTRAINT Teacher_primary_key PRIMARY KEY (Teacher_id);
    CONSTRAINT Courses_id FOREIGN KEY (Course_id)
        REFERENCES public.Courses (Courses_id)  MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE public.Students (
    Student_id bigint NOT NULL,
    Name char[],
    Surname char[],
    Taken boolean
    CONSTRAINT Student_primary_key PRIMARY KEY (Student_id);
);

CREATE TABLE public.Student_taken (
    Student_id bigint NOT NULL,
    Course_id bigint NOT NULL,
    Taken_id bigint NOT NULL
    CONSTRAINT Taken_primary_key PRIMARY KEY (Taken_id);
);

CREATE TABLE public.Marks (
    Course_id bigint NOT NULL,
    Date date,
    Taken_id bigint NOT NULL,
    Mark_homework integer,
    Attending boolean
    CONSTRAINT Marks_pkey PRIMARY KEY (Course_id, Taken_id)
    CONSTRAINT Course_id FOREIGN KEY (Course_id) REFERENCES public.Courses(Courses_id)  MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    CONSTRAINT Taken_id FOREIGN KEY (Taken_id) REFERENCES public.Student_taken(Taken_id)   MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE public.Schedule (
    Course_id bigint,
    Teacher_id bigint,
    Data date
    CONSTRAINT Course_id FOREIGN KEY (Course_id) REFERENCES public.Courses(Courses_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
    CONSTRAINT Teacher_id FOREIGN KEY (Teacher_id) REFERENCES public.Teacher(Teacher_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);