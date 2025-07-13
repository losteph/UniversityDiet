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

## 📁📄 Struttura del Repository
📦 diet-planning-optimization
 ┣ 📂 ampl/
 ┃ ┣ 📄 model.mod
 ┃ ┣ 📄 data.dat
 ┣ 📂 matlab/
 ┃ ┗ 📄 diet_optimizer.m
 ┣ 📂 excel/
 ┃ ┗ 📄 dieta_ottimale.xlsx
 ┣ 📄 README.md
 ┗ 📄 relazione.pdf

## 🚀 How to Run (AMPL)

```ampl
model model.mod;
data data.dat;
solve;
display x, cost;
```

## 👨‍🎓 Autore

- **Stefano Di Lena**
- Politecnico di Bari
- Anno 2025
- Tema d'anno per l'esame di *Optimization and Control*
