
export function isLate(submissionDate: Date, dueDate: Date): boolean {
    return submissionDate.getTime() > dueDate.getTime();
}
