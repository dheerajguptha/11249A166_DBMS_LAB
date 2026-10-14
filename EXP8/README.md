# Experiment 8 output

## Output for step 6

| SID | SName | Course | Faculty | FacultyPhone | Dept | HOD |
| --- | --- | --- | --- | --- | --- | --- |
| S1 | Arun | DBMS | Ravi | 9990001 | CSE | Dr. Sharma |
| S1 | Arun | OS | Meena | 9990002 | CSE | Dr. Sharma |
| S2 | Bala | DBMS | Ravi | 9990001 | CSE | Dr. Sharma |

## Output for step 27

| Course | Faculty | FacultyPhone | Dept | HOD |
| --- | --- | --- | --- | --- |
| DBMS | Ravi | 9990001 | CSE | Dr. Sharma |
| OS | Meena | 9990002 | CSE | Dr. Sharma |

## Output for step 47

| Faculty | Course | Textbook |
| --- | --- | --- |
| Ravi | DBMS | Korth |
| Ravi | DBMS | Navathe |
| Meena | OS | Silberschatz |

## Output for step 49

| Column | Type |
| --- | --- |
| Faculty | VARCHAR2(30) |
| FacultyPhone | VARCHAR2(15) |
| Dept | VARCHAR2(10) |

## Student

| SID | SName |
| --- | --- |
| S1 | Arun |
| S2 | Bala |

## Course_Faculty

| Course | Faculty | FacultyPhone | Dept | HOD |
| --- | --- | --- | --- | --- |
| DBMS | Ravi | 9990001 | CSE | Dr. Sharma |
| OS | Meena | 9990002 | CSE | Dr. Sharma |

## Enrollment

| SID | Course |
| --- | --- |
| S1 | DBMS |
| S1 | OS |
| S2 | DBMS |

## Department

| Dept | HOD |
| --- | --- |
| CSE | Dr. Sharma |

## Faculty_Dept

| Faculty | FacultyPhone | Dept |
| --- | --- | --- |
| Ravi | 9990001 | CSE |
| Meena | 9990002 | CSE |

## Course_3NF

| Course | Faculty |
| --- | --- |
| DBMS | Ravi |
| OS | Meena |

## Faculty_Course

| Faculty | Course |
| --- | --- |
| Ravi | DBMS |
| Ravi | OS |

## Faculty_Language

| Faculty | Language |
| --- | --- |
| Ravi | English |
| Ravi | Hindi |

## Faculty_Course_5NF

| Faculty | Course |
| --- | --- |
| Ravi | DBMS |
| Meena | OS |

## Course_Textbook_5NF

| Course | Textbook |
| --- | --- |
| DBMS | Korth |
| DBMS | Navathe |
| OS | Silberschatz |

## Faculty_Textbook_5NF

| Faculty | Textbook |
| --- | --- |
| Ravi | Korth |
| Ravi | Navathe |
| Meena | Silberschatz |


## Output for step 48

| TABLE_NAME |
| --- |
| COURSE_3NF |
| COURSE_FACULTY |
| COURSE_TEXTBOOK_5NF |
| DEPARTMENT |
| ENROLLMENT |
| FACULTY_COURSE |
| FACULTY_COURSE_5NF |
| FACULTY_DEPT |
| FACULTY_LANGUAGE |
| FACULTY_TEXTBOOK_5NF |
| STUDENT |
| STUDENTCOURSE_1NF |

## Output for step 50

| CONSTRAINT_NAME | CONSTRAINT_TYPE | TABLE_NAME |
| --- | --- | --- |
| <generated primary-key name> | P | COURSE_3NF |
| <generated foreign-key name> | R | COURSE_3NF |
| <generated primary-key name> | P | DEPARTMENT |
| <generated primary-key name> | P | FACULTY_DEPT |
| <generated foreign-key name> | R | FACULTY_DEPT |
| <generated primary-key name> | P | STUDENT |

## Output for step 51

| TABLE_NAME | COLUMN_NAME | CONSTRAINT_TYPE |
| --- | --- | --- |
| COURSE_3NF | COURSE | P |
| COURSE_3NF | FACULTY | R |
| COURSE_FACULTY | COURSE | P |
| COURSE_TEXTBOOK_5NF | COURSE | P |
| COURSE_TEXTBOOK_5NF | TEXTBOOK | P |
| DEPARTMENT | DEPT | P |
| ENROLLMENT | COURSE | P |
| ENROLLMENT | COURSE | R |
| ENROLLMENT | SID | P |
| ENROLLMENT | SID | R |
| FACULTY_COURSE | COURSE | P |
| FACULTY_COURSE | FACULTY | P |
| FACULTY_COURSE_5NF | COURSE | P |
| FACULTY_COURSE_5NF | FACULTY | P |
| FACULTY_DEPT | DEPT | R |
| FACULTY_DEPT | FACULTY | P |
| FACULTY_LANGUAGE | FACULTY | P |
| FACULTY_LANGUAGE | LANGUAGE | P |
| FACULTY_TEXTBOOK_5NF | FACULTY | P |
| FACULTY_TEXTBOOK_5NF | TEXTBOOK | P |
| STUDENT | SID | P |
| STUDENTCOURSE_1NF | COURSE | P |
| STUDENTCOURSE_1NF | SID | P |
