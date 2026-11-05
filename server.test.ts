
import { describe, it, expect } from "vitest";
import request from "supertest";
import app from "./server.js";

describe("API Routes", () => {
    it("GET /courses should return the courses list", async () => {
        const response = await request(app).get("/courses");

        expect(response.status).toBe(200);
        expect(response.body).toHaveLength(3);
        expect(response.body[0].name).toBe("Software Engineering");
    });

    it("POST /enrolments should create an enrolment", async () => {
        const response = await request(app)
            .post("/enrolments")
            .send({ studentId: 1, courseId: 2 });

        expect(response.status).toBe(201);
        expect(response.body.message).toBe("Enrolment created successfully");
        expect(response.body.enrolment).toEqual({
            studentId: 1,
            courseId: 2
        });
    });

    it("POST /enrolments should return 400 for invalid input", async () => {
        const response = await request(app)
            .post("/enrolments")
            .send({ studentId: "abc", courseId: 2 });

        expect(response.status).toBe(400);
    });
});
