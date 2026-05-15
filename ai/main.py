from fastapi import FastAPI
from pydantic import BaseModel, Field
from typing import List

app = FastAPI(title="AI Academic Service")

# -----------------------------------
# HOME
# -----------------------------------
@app.get("/")
def home():
    return {"message": "AI Service Running"}

# -----------------------------------
# MODEL
# -----------------------------------
class Student(BaseModel):

    name: str

    attendance: float = Field(ge=0, le=100)

    assignments: float = Field(ge=0, le=100)

    quiz: float = Field(ge=0, le=100)

    midterm: float = Field(ge=0, le=100)

    final: float = Field(ge=0, le=100)

# -----------------------------------
# SCORE CALCULATION
# -----------------------------------
def calculate_score(
    attendance,
    assignments,
    quiz,
    midterm,
    final
):

    return (
        0.10 * attendance +
        0.15 * assignments +
        0.15 * quiz +
        0.20 * midterm +
        0.40 * final
    )

# -----------------------------------
# RISK LEVEL
# -----------------------------------
# -----------------------------------
# RISK LEVEL
# -----------------------------------
def risk_level(final, score):
    # ممتاز
    if score >= 65:
        return "Low Risk"

    # جيد
    elif score >= 45:
        return "Medium Risk"

    # ضعيف
    else:
        return "High Risk"
# -----------------------------------
# FAIL PROBABILITY
# -----------------------------------

def fail_probability(score):

    probability = 100 - score

    probability = max(5, probability)

    probability = min(95, probability)

    return f"{round(probability)}%"

# -----------------------------------
# STUDENT ANALYSIS
# -----------------------------------
@app.post("/student-analysis")
def student_analysis(students: List[Student]):

    results = []

    for s in students:

        score = calculate_score(
            s.attendance,
            s.assignments,
            s.quiz,
            s.midterm,
            s.final
        )

        risk = risk_level(
            s.final,
            score
        )

        fail = fail_probability(score)

        results.append({

            "name": s.name,

            "academic_score": round(score, 2),

            "risk_level": risk,

            "fail_probability": fail
        })

    return results

# -----------------------------------
# DOCTOR VIEW
# -----------------------------------
@app.post("/doctor-view")
def doctor_view(students: List[Student]):

    high_risk = 0

    scores = []

    for s in students:

        score = calculate_score(
            s.attendance,
            s.assignments,
            s.quiz,
            s.midterm,
            s.final
        )

        risk = risk_level(
            s.final,
            score
        )

        scores.append(score)

        if risk == "High Risk":
            high_risk += 1

    average_score = (
        sum(scores) / len(scores)
        if scores else 0
    )

    return {

        "students_at_risk": high_risk,

        "average_score": round(average_score, 2),

        "warning": f"{high_risk} students are at risk"
    }