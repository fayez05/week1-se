
import express from "express";

const app = express();

app.use(express.json());

app.get("/courses", (req, res) => {
    const courses = [
        { id: 1, name: "Software Engineering" },
        { id: 2, name: "Database Systems" },
        { id: 3, name: "Web Development" }
    ];

    res.status(200).json(courses);
});

app.post("/enrolments", (req, res) => {
    const { studentId, courseId } = req.body;

    if (
        typeof studentId !== "number" ||
        typeof courseId !== "number"
    ) {
        return res.status(400).json({
            message: "studentId and courseId must be numbers"
        });
    }

    res.status(201).json({
        message: "Enrolment created successfully",
        enrolment: {
            studentId,
            courseId
        }
    });
});

export default app;
