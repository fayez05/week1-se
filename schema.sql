
-- Users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT
);

-- Enrolments table
CREATE TABLE enrolments (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    course_id INTEGER NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'active'
        CHECK (status IN ('active', 'completed', 'cancelled')),
    UNIQUE (user_id, course_id)
);

-- Submissions table
CREATE TABLE submissions (
    id SERIAL PRIMARY KEY,
    enrolment_id INTEGER NOT NULL REFERENCES enrolments(id) ON DELETE CASCADE,
    title VARCHAR(150) NOT NULL,
    content TEXT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    due_date TIMESTAMP NOT NULL,
    grade NUMERIC(5,2)
        CHECK (grade >= 0 AND grade <= 100)
);
