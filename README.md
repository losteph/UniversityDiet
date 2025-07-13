# 🥗 Diet Planning Optimization for University Students

Problema di ottimizzazione modellato tramite *Mixed Integer Linear Programmin (MILP)*. Problema implementato in **AMPL, Excel, MATLAB**, con l'obiettivo di ottenere pasti vari, bilanciati ed a basso costo. 

## 🧩 Problema

Uno studente universitario ha un budget settimanale di 70$ per acquistare cibo per 7 pranzi e 7 cene. Si richiede che la dieta sia:

- Nutrizionalmente equilibrata: ogni giorno, circa il 55% delle calorie da carboidrati, il 25% da grassi e il 20% da proteine, con tolleranza del ±2%.
- Completa e varia: includendo diverse fonti di proteine (carne, pesce, legumi, formaggi).
- Controllata: rispettando vincoli di salute e preferenza.

### ⚠️ Vincoli Alimentari

- Carne rossa: massimo 1 volta a settimana
- Salmone e patate: massimo 2 volte a settimana
- Legumi: almeno 3 volte a settimana
- Uova e salmone: non possono comparire lo stesso giorno
- Fabbisogno calorico giornaliero: 2300–3000 kcal

## 📁📄 Repo Structure

```
📦 UniversityDiet
 ┣ 📂 AMPL/
 ┃ ┣ 📄 UniversityDiet.mod
 ┃ ┣ 📄 UniversityDiet.dat
 ┣ 📂 matlab/
 ┃ ┗ 📄 UniversityDiet.m
 ┣ 📂 Excel/
 ┃ ┗ 📄 UniversityDiet.xlsx
 ┣ 📄 README.md
 ┗ 📄 TemaOptimizationControl.pdf
```

## 🚀 How to Run (AMPL)

```ampl
option solver cplex;
model model.mod;
data data.dat;
solve;
display Q, CostMin;
```
