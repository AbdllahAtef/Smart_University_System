from fastapi import FastAPI
from pydantic import BaseModel, Field
from typing import List
from datetime import datetime

app = FastAPI(title="AI Academic Service")

# -----------------------------
# HOME
# -----------------------------
@app.get("/")
def home():
    return {"message": "AI Service Running"}

# -----------------------------
# MODEL + VALIDATION
# -----------------------------
class Student(BaseModel):
    name: str
    attendance: float = Field(ge=0, le=100)
    assignments: float = Field(ge=0, le=100)
    quiz: float = Field(ge=0, le=100)
    trend: float = Field(ge=0, le=100)
    created_at: datetime = datetime.now()

# -----------------------------
# AI LOGIC
# -----------------------------
def calculate_score(a, b, c, d):
    return 0.3*a + 0.25*b + 0.35*c + 0.1*d

def risk_level(att, assign, quiz, score):
    if att < 40 or quiz < 45 or assign < 50:
        return "High Risk"
    if score >= 75:
        return "Low Risk"
    elif score >= 60:
        return "Medium Risk"
    else:
        return "High Risk"

def fail_probability(score):
    if score >= 75:
        return 10
    elif score >= 60:
        return 40
    elif score >= 50:
        return 60
    else:
        return 80

# -----------------------------
# STUDENT ANALYSIS
# -----------------------------
@app.post("/student-analysis")
def student_analysis(students: List[Student]):

    results = []

    for s in students:
        score = calculate_score(s.attendance, s.assignments, s.quiz, s.trend)
        risk = risk_level(s.attendance, s.assignments, s.quiz, score)
        fail = fail_probability(score)

        results.append({
            "name": s.name,
            "academic_score": round(score, 2),
            "risk_level": risk,
            "fail_probability": f"{fail}%"
        })

    return results

# -----------------------------
# DOCTOR VIEW
# -----------------------------
@app.post("/doctor-view")
def doctor_view(students: List[Student]):

    high_risk = 0
    quiz_scores = []
    attendance_scores = []

    for s in students:
        score = calculate_score(s.attendance, s.assignments, s.quiz, s.trend)
        risk = risk_level(s.attendance, s.assignments, s.quiz, score)

        quiz_scores.append(s.quiz)
        attendance_scores.append(s.attendance)

        if risk == "High Risk":
            high_risk += 1

    return {
        "students_at_risk": high_risk,
        "average_quiz": round(sum(quiz_scores) / len(quiz_scores), 2),
        "average_attendance": round(sum(attendance_scores) / len(attendance_scores), 2),
        "warning": f"{high_risk} students are at risk"
    }