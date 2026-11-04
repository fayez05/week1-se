type GradeResult = {
    percentage: number;
    letter: string;
};

function calculateGrade(scores: number[], totalMarks: number): GradeResult {

    const obtainedMarks = scores.reduce((sum, score) => sum + score, 0);

    const percentage = (obtainedMarks / totalMarks) * 100;

    let letter: string;

    if (percentage >= 90) {
        letter = "A";
    } else if (percentage >= 80) {
        letter = "B";
    } else if (percentage >= 70) {
        letter = "C";
    } else if (percentage >= 60) {
        letter = "D";
    } else {
        letter = "F";
    }

    return {
        percentage,
        letter
    };
}