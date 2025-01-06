clear
clc

fis = newfis('Kupovina dionica');


fis = addInput(fis, [-2000 5000], 'Name', 'Trzisna_cijena');
fis = addMF(fis, 'Trzisna_cijena', 'trimf', [-2000 0 50], 'Name', 'Mala');
fis = addMF(fis, 'Trzisna_cijena', 'trapmf', [30 55 95 125], 'Name', 'Srednja');
fis = addMF(fis, 'Trzisna_cijena', 'trimf', [100 250 5000], 'Name', 'Velika');

fis = addInput(fis, [-36000000000 2500000000], 'Name', 'Kapitalizacija');
fis = addMF(fis, 'Kapitalizacija', 'trimf', [-36000000000 -4000000000 50000000], 'Name', 'Nano');
fis = addMF(fis, 'Kapitalizacija', 'trimf', [45500000 179500000 345500000], 'Name', 'Mikro');
fis = addMF(fis, 'Kapitalizacija', 'trimf', [300000000 1200000000 2500000000], 'Name', 'Mala');
fis = addMF(fis, 'Kapitalizacija', 'trimf', [2000000000 7000000000 12000000000], 'Name', 'Srednja');
fis = addMF(fis, 'Kapitalizacija', 'trimf', [10000000000 80000000000 150000000000], 'Name', 'Velika');
fis = addMF(fis, 'Kapitalizacija', 'trapmf', [100000000000 150000000000 200000000000 200000000000], 'Name', 'Mega');

fis = addInput(fis, [-50 100], 'Name', 'Pad_vrijednosti');
fis = addMF(fis, 'Pad_vrijednosti', 'trimf', [-50 0 50], 'Name', 'Mali');
fis = addMF(fis, 'Pad_vrijednosti', 'trapmf', [45 70 100 100], 'Name', 'Veliki');

fis = addInput(fis, [-50 100], 'Name', 'Rast_vrijednosti');
fis = addMF(fis, 'Rast_vrijednosti', 'trimf', [-50 0 50], 'Name', 'Mali');
fis = addMF(fis, 'Rast_vrijednosti', 'trapmf', [45 70 100 100], 'Name', 'Veliki');

fis = addInput(fis, [-1 5], 'Name', 'Status_dionicara');
fis = addMF(fis, 'Status_dionicara', 'trapmf', [-1.8 -0.2 1.5 3], 'Name', 'Los');
fis = addMF(fis, 'Status_dionicara', 'trapmf', [2.5 3.5 5 5], 'Name', 'Dobar');

% Definisanje izlaza
fis = addOutput(fis, [-4 14], 'Name', 'Odluka');
fis = addMF(fis, 'Odluka', 'trimf', [-4 0 4], 'Name', 'Prodaj');
fis = addMF(fis, 'Odluka', 'trapmf', [3 4.5 6 7.5], 'Name', 'Zadrzi');
fis = addMF(fis, 'Odluka', 'trimf', [6 10 14], 'Name', 'Kupi');


rules = [];
rulesIndex = 1;

for trzisna = 1:3
    for kapital = 1:6
        for pad = 1:2
            for rast = 1:2
                for status = 1:2
                    if trzisna == 1 
                        stanje = 3; 
                    elseif trzisna == 2 
                        stanje = 1; 
                    else
                        stanje = 2; 
                    end
                  
                    rules(rulesIndex,:) = [trzisna kapital pad rast status stanje 1 1];
                    rulesIndex = rulesIndex + 1;
                end
            end
        end
    end
end

fis = addRule(fis, rules);

mfedit(fis);
