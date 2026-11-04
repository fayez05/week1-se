# Course Enrolment API

## 1. Get All Courses

- Method: GET
- Path: /courses
- Status Codes:
  - 200 OK: Courses retrieved successfully.
  - 500 Internal Server Error: Server error.

## 2. Get Course by ID

- Method: GET
- Path: /courses/:id
- Status Codes:
  - 200 OK: Course retrieved successfully.
  - 404 Not Found: Course does not exist.
  - 500 Internal Server Error: Server error.

## 3. Enrol Student in a Course

- Method: POST
- Path: /enrolments
- Status Codes:
  - 201 Created: Student enrolled successfully.
  - 400 Bad Request: Invalid or missing data.
  - 404 Not Found: Student or course not found.
  - 409 Conflict: Student is already enrolled.
  - 500 Internal Server Error: Server error.

## 4. Cancel Enrolment

- Method: DELETE
- Path: /enrolments/:id
- Status Codes:
  - 204 No Content: Enrolment cancelled successfully.
  - 404 Not Found: Enrolment does not exist.
  - 500 Internal Server Error: Server error.

## 5. Get Student Enrolments

- Method: GET
- Path: /students/:studentId/enrolments
- Status Codes:
  - 200 OK: Student enrolments retrieved successfully.
  - 404 Not Found: Student does not exist.
  - 500 Internal Server Error: Server error.