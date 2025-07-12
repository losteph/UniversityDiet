🥗 Diet Optimization for University Students
This project addresses the challenge of planning a balanced and sustainable diet for university students, combining nutritional requirements, budget constraints, and variety rules over a one-month period.

📄 Contents
relazione.pdf – Project report with full problem formulation and discussion

dieta.xlsx – Excel dataset with food costs and nutritional values

modello.mod – AMPL model implementing the mixed-integer linear program (MILP)

dati.dat – Input data for the AMPL model

⚙️ Problem Description
The goal is to minimize the total cost of 60 meals (30 lunches + 30 dinners), while ensuring:

Daily intake of 2500 kcal

Macronutrient balance: ~60% carbs, 20% fat, 20% protein

Dietary variety (no repeated meals, weekly limits)

Budget ≤ 300 USD/month

The model uses continuous variables for food quantities and binary variables for enforcing meal variety.

🚀 How to Run (AMPL)
ampl
Copy
Edit
model modello.mod;
data dati.dat;
solve;
display x, cost;
🧮 Optimization Type
Mixed Integer Linear Programming (MILP)

Multi-objective (cost + nutritional balance)
