
import { describe, it, expect } from "vitest";
import { isLate } from "./dueDate.js";

describe("isLate", () => {
    const dueDate = new Date("2026-11-05T12:00:00");

    it("should return true when submitted after the due date", () => {
        const submissionDate = new Date("2026-11-05T13:00:00");
        expect(isLate(submissionDate, dueDate)).toBe(true);
    });

    it("should return false when submitted before the due date", () => {
        const submissionDate = new Date("2026-11-05T11:00:00");
        expect(isLate(submissionDate, dueDate)).toBe(false);
    });

    it("should return false when submitted exactly on the due date", () => {
        const submissionDate = new Date("2026-11-05T12:00:00");
        expect(isLate(submissionDate, dueDate)).toBe(false);
    });
});
