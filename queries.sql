
-- 1. Get all users
SELECT *
FROM users;


-- 2. Get all courses
SELECT *
FROM courses;


-- 3. Get enrolments with user and course information (JOIN)
SELECT
    users.full_name,
    courses.title AS course_title,
    enrolments.enrolled_at,
    enrolments.status
FROM enrolments
JOIN users ON enrolments.user_id = users.id
JOIN courses ON enrolments.course_id = courses.id;


-- 4. Get submissions with student and course information (JOIN)
SELECT
    users.full_name,
    courses.title AS course_title,
    submissions.title AS submission_title,
    submissions.submitted_at,
    submissions.grade
FROM submissions
JOIN enrolments ON submissions.enrolment_id = enrolments.id
JOIN users ON enrolments.user_id = users.id
JOIN courses ON enrolments.course_id = courses.id;


-- 5. Count enrolments for each course (GROUP BY)
SELECT
    courses.title,
    COUNT(enrolments.id) AS total_enrolments
FROM courses
LEFT JOIN enrolments ON courses.id = enrolments.course_id
GROUP BY courses.id, courses.title;


-- 6. Find users enrolled in more than one course (GROUP BY + HAVING)
SELECT
    users.full_name,
    COUNT(enrolments.id) AS total_courses
FROM users
JOIN enrolments ON users.id = enrolments.user_id
GROUP BY users.id, users.full_name
HAVING COUNT(enrolments.id) > 1;


-- 7. Calculate average grade for each course (GROUP BY)
SELECT
    courses.title,
    AVG(submissions.grade) AS average_grade
FROM submissions
JOIN enrolments ON submissions.enrolment_id = enrolments.id
JOIN courses ON enrolments.course_id = courses.id
GROUP BY courses.id, courses.title;


-- 8. Find late submissions
SELECT
    users.full_name,
    courses.title AS course_title,
    submissions.title AS submission_title,
    submissions.submitted_at,
    submissions.due_date
FROM submissions
JOIN enrolments ON submissions.enrolment_id = enrolments.id
JOIN users ON enrolments.user_id = users.id
JOIN courses ON enrolments.course_id = courses.id
WHERE submissions.submitted_at > submissions.due_date;


-- 9. Create an index on enrolment_id
CREATE INDEX idx_submissions_enrolment_id
ON submissions(enrolment_id);


-- 10. Explain query execution plan
EXPLAIN
SELECT
    submissions.id,
    submissions.title,
    submissions.grade
FROM submissions
JOIN enrolments ON submissions.enrolment_id = enrolments.id
WHERE enrolments.user_id = 1;
