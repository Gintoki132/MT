
clear
clc

fis = newfis('dijabetes');

fis = addInput(fis, [0 1], 'Name', 'vjerovatnoca');
fis = addMF(fis, 'vjerovatnoca', 'trapmf', [0 0 0.2 0.25], 'Name', 'niska');
fis = addMF(fis, 'vjerovatnoca', 'trapmf', [0.2 0.4 0.5 0.7], 'Name', 'srednja');
fis = addMF(fis, 'vjerovatnoca', 'trapmf', [0.65 0.8 1 1], 'Name', 'visoka');

fis = addInput(fis, [2.5 28], 'Name', 'glukoza');
fis = addMF(fis, 'glukoza', 'trapmf', [2.5 2.5 3 4], 'Name', 'vrlo_mala');
fis = addMF(fis, 'glukoza', 'trapmf', [3 4 5 6], 'Name', 'mala');
fis = addMF(fis, 'glukoza', 'trapmf', [5 6 7 8], 'Name', 'normalna');
fis = addMF(fis, 'glukoza', 'trapmf', [7 12 28 28], 'Name', 'visoka');

fis = addInput(fis, [0.2 45], 'Name', 'trigliceridi');
fis = addMF(fis, 'trigliceridi', 'trapmf', [0.2 0.2 5 7], 'Name', 'niski');
fis = addMF(fis, 'trigliceridi', 'trapmf', [5 8 16 20], 'Name', 'normalni');
fis = addMF(fis, 'trigliceridi', 'trapmf', [18 25 45 45], 'Name', 'visoki');

fis = addInput(fis, [0.2 10], 'Name', 'hdlc');
fis = addMF(fis, 'hdlc', 'trapmf', [0.2 0.2 2 3], 'Name', 'nizak');
fis = addMF(fis, 'hdlc', 'trapmf', [2 3 5 6], 'Name', 'normalan');
fis = addMF(fis, 'hdlc', 'trapmf', [5 7 10 10], 'Name', 'visok');


fis = addOutput(fis, [0 1], 'Name', 'odluka');
fis = addMF(fis, 'odluka', 'trapmf', [0 0 0.3 0.5], 'Name', 'zdrav');
fis = addMF(fis, 'odluka', 'trapmf', [0.4 0.7 1 1], 'Name', 'bolestan');


rules = [];
rulesIndex = 1;

for vjerovatnoca = 1:3
    for glukoza = 1:4
        for trigliceridi = 1:3
            for hdlc = 1:3
                if hdlc == 3 && (trigliceridi == 3 || glukoza == 4)
                    rule_output = 1; 
                else
                    rule_output = 2; 
                end
             
                rules(rulesIndex,:) = [vjerovatnoca glukoza trigliceridi hdlc rule_output 1 1];
                rulesIndex = rulesIndex + 1;
            end
        end
    end
end

fis = addRule(fis, rules);

mfedit(fis);



