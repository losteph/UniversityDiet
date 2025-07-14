# Insiemi
set ALIMENTI;
set DAY;

# Parametri (valori per 100g di alimento, basati sulla tabella)
param Costo {ALIMENTI};
param Kcal {ALIMENTI};
param Carbo {ALIMENTI};
param Grassi {ALIMENTI};
param Prot {ALIMENTI};
# Fabbisogni calorici giornaleri
param KcalMin_gg := 2300;
param KcalMax_gg := 2700;
# Fabbisogni nutrizionali giornalieri (g/giorno) [calcolati nel nosrto caso per ottenere circa (+-2%): 55% carb, 25% fat, 20% prot]
param CarbMin_gg := 304.75; #0,53*2300/4
param CarbMax_gg := 384.75; #0,57*2700/4
param GrassiMin_gg := 58.78; #0,23*2300/9
param GrassiMax_gg := 81; #0,27*2700/9
param ProtMin_gg :=103.5; #0,18*2300/4
param ProtMax_gg := 148.5; #0,22*2700/4
# Big number
param M := 10;
# Parametro aggiuntivo (utile a far scegliere almeno 50g di ogni alimento a settimana)
param epsilon := 0.5;

# Variabili Decisionali
var Q {ALIMENTI, DAY} >= 0;
var y {ALIMENTI, DAY} binary;

# Funzione Obiettivo
minimize TotalCost : sum {a in ALIMENTI, d in DAY} Costo[a]*Q[a,d];

# Vincoli
s.t. BilancioSettimanale: sum {a in ALIMENTI, d in DAY} Costo[a] * Q[a,d] <= 50;

s.t. DailyKcalMin {d in DAY} : sum {a in ALIMENTI} Kcal[a]*Q[a,d] >= KcalMin_gg;
s.t. DailyKcalMax {d in DAY} : sum {a in ALIMENTI} Kcal[a]*Q[a,d] <= KcalMax_gg;

s.t. DailyCarbMin {d in DAY}: sum {a in ALIMENTI} Carbo[a]*Q[a,d] >= CarbMin_gg;
s.t. DailyCarbMax {d in DAY}: sum {a in ALIMENTI} Carbo[a]*Q[a,d] <= CarbMax_gg;
s.t. DailyFatMin {d in DAY}: sum {a in ALIMENTI} Grassi[a]*Q[a,d] >= GrassiMin_gg;
s.t. DailyFatMax {d in DAY}: sum {a in ALIMENTI} Grassi[a]*Q[a,d] <= GrassiMax_gg;
s.t. DailyProtMin {d in DAY}: sum {a in ALIMENTI} Prot[a]*Q[a,d] >= ProtMin_gg;
s.t. DailyProtMax {d in DAY}: sum {a in ALIMENTI} Prot[a]*Q[a,d] <= ProtMax_gg;
#Potevano essere scritti anche così per una formulazione più generica
#s.t. DailyCarbMin_Ratio {d in DAY}: sum {a in ALIMENTI} Carb[a] * Q[a,d] * 4 >= 0.53 * (sum {a_k in ALIMENTI} Kcal[a_k] * Q[a_k,d]);

s.t. LinkQy {a in ALIMENTI, d in DAY}: Q[a,d] <= M*y[a,d];

s.t. MeatLimit: sum {d in DAY} y["CarneRossa",d] = 1;
s.t. SalmonLimit: sum {d in DAY} y["Salmone",d] <= 2;
s.t. PotatoLimit: sum {d in DAY} y["Mozzarella",d] <= 3;
s.t. LegumiMin: sum {d in DAY} y["Legumi",d] >= 4;

s.t. EggSalmon {d in DAY}: y["Uova",d] + y["Salmone",d] <= 1;

# Vincoli superflui (gli aggiunti perché inizialmente non faceva una dieta varia ed equilibrata ma sceglieva solo uova e pasta)
s.t. PolloMin: sum {d in DAY} y["Pollo",d] >= 1;
s.t. SalmoneMin: sum {d in DAY} y["Salmone",d] >= 1;
s.t. MerluzzoMin: sum {d in DAY} y["Merluzzo",d] >= 1;
s.t. MozzarellaMin: sum {d in DAY} y["Mozzarella",d] >= 1;
s.t. PastaMin: sum {d in DAY} y["Pasta",d] >= 1;
s.t. PatateMin: sum {d in DAY} y["Patate",d] >= 1;
s.t. PaneMin: sum {d in DAY} y["Pane",d] >= 1;
s.t. UovaMin: sum {d in DAY} y["Uova",d] >= 1;

# Serve per far prendere almeno 50g di ogni elemento se no sceglieva solo uova e pasta.
s.t. LinkYQ_lower {a in ALIMENTI, d in DAY}: Q[a,d] >= epsilon * y[a,d];

# Vincoli aggiuntivi sulle quantità max giornaliere/settimanali
s.t. MaxMeatWeek: sum {d in DAY} Q["CarneRossa",d] <= 3.5;

s.t. MaxUovaGg {d in DAY}: Q["Uova",d] <= 1;
s.t. MaxSalmoneGg {d in DAY}: Q["Salmone",d] <= 1.5;
s.t. MaxMerluzzoGg {d in DAY}: Q["Merluzzo",d] <= 3;
s.t. MaxLegumiGg {d in DAY}: Q["Legumi",d] <= 1.5;
s.t. MaxPastaGg {d in DAY}: Q["Pasta",d] <= 5;
s.t. MaxPaneGg {d in DAY}: Q["Pane",d] <= 1.5;
s.t. MaxPatateGg {d in DAY}: Q["Patate",d] <= 2;
s.t. MaxPolloGg {d in DAY}: Q["Pollo",d] <= 3;
s.t. MaxMozzarellaGg {d in DAY}: Q["Mozzarella",d] <= 2;

# No uova due giorni di fila
s.t. NoUovaLunMar: y["Uova","lun"] + y["Uova","mar"] <= 1;
s.t. NoUovaMarMer: y["Uova","mar"] + y["Uova","mer"] <= 1;
s.t. NoUovaMerGio: y["Uova","mer"] + y["Uova","gio"] <= 1;
s.t. NoUovaGioVen: y["Uova","gio"] + y["Uova","ven"] <= 1;
s.t. NoUovaVenSab: y["Uova","ven"] + y["Uova","sab"] <= 1;
s.t. NoUovaSabDom: y["Uova","sab"] + y["Uova","dom"] <= 1;
