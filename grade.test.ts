
import { describe, it, expect } from "vitest";
import { calculateGrade } from "./grade.js";

describe("calculateGrade", () => {
    it("should return A for 90 or above", () => {
        expect(calculateGrade([90], 100).letter).toBe("A");
    });

    it("should return B for 80 to 89", () => {
        expect(calculateGrade([85], 100).letter).toBe("B");
    });

    it("should return C for 70 to 79", () => {
        expect(calculateGrade([75], 100).letter).toBe("C");
    });

    it("should return D for 60 to 69", () => {
        expect(calculateGrade([65], 100).letter).toBe("D");
    });

    it("should return F for below 60", () => {
        expect(calculateGrade([50], 100).letter).toBe("F");
    });
});
