clear
clc

fis = newfis('zemljisteEks');

fis = addInput(fis,[0 1000],'name','Ocjena');
fis = addMF(fis,'Ocjena','trimf',   [0 125.5 250],'name','Losa');
fis = addMF(fis,'Ocjena','trimf',  [200 350 500],'name','Srednja');
fis = addMF(fis,'Ocjena','trimf',   [450 610 750],'name','Prosjecna');
fis = addMF(fis,'Ocjena','trimf',   [700 853.1 1000],'name','Dobra');

fis = addInput(fis,[0 1000],'name','Kupovina');
fis = addMF(fis,'Kupovina','trimf', [0 200 400],'name','NeKupiti');
fis = addMF(fis,'Kupovina','trimf', [350 550 750],'name','MozdaKupiti');
fis = addMF(fis,'Kupovina','trimf', [700 850 1000 1100],'name','Kupiti');

fis = addOutput(fis,[0 1000],'name','OcjenaF');
fis = addMF(fis,'OcjenaF','trimf',   [0 125.5 250],'name','Losa');
fis = addMF(fis,'OcjenaF','trimf',  [200 350 500],'name','Srednja');
fis = addMF(fis,'OcjenaF','trimf',   [450 610 750],'name','Prosjecna');
fis = addMF(fis,'OcjenaF','trimf',   [700 853.1 1000],'name','Dobra');

fis = addOutput(fis,[0 1000],'name','KupovinaF');
fis = addMF(fis,'KupovinaF','trimf', [0 200 400],'name','NeKupiti');
fis = addMF(fis,'KupovinaF','trimf', [350 550 750],'name','MozdaKupiti');
fis = addMF(fis,'KupovinaF','trimf', [700 850 1000 1100],'name','Kupiti');


mfedit(fis);