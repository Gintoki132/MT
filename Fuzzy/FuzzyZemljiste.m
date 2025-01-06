clear
clc

fis = newfis('zemljiste');

fis = addInput(fis,[0 1000],'name','Povrsina_zemljista');
fis = addMF(fis,'Povrsina_zemljista','trimf', [0 200 400],'name','Mala');
fis = addMF(fis,'Povrsina_zemljista','trimf', [350 550 750],'name','Srednja');
fis = addMF(fis,'Povrsina_zemljista','trapmf', [700 850 1000 1100],'name','Velika');

fis = addInput(fis,[0 1000],'name','Cijena_zemljista');
fis = addMF(fis,'Cijena_zemljista','trimf',  [0 166.2 360],'name','Niska');
fis = addMF(fis,'Cijena_zemljista','trapmf',  [317 422 591 704.3],'name','Srednja');
fis = addMF(fis,'Cijena_zemljista','trimf',  [668 836.9 999],'name','Visoka');

fis = addInput(fis,[0 1000],'name','Zeljena_lokacija');
fis = addMF(fis,'Zeljena_lokacija','trimf',  [0 150 300],'name','Manje_pristupacna');
fis = addMF(fis,'Zeljena_lokacija','trimf',  [280 500 682],'name','Srednje_pristupacna');
fis = addMF(fis,'Zeljena_lokacija','trimf',  [650 850 1000],'name','Pristupacna');

fis = addInput(fis,[0 1000],'name','Troskovi_prikljucenja');
fis = addMF(fis,'Troskovi_prikljucenja','trimf', [0 200 400],'name','Mali');
fis = addMF(fis,'Troskovi_prikljucenja','trimf', [350 550 750],'name','Srednji');
fis = addMF(fis,'Troskovi_prikljucenja','trapmf', [700 850 1000 1100],'name','Veliki');

fis = addInput(fis,[0 1000],'name','Troskovi_izgradnje');
fis = addMF(fis,'Troskovi_izgradnje','trimf',  [0 150 300],'name','Mali');
fis = addMF(fis,'Troskovi_izgradnje','trimf',  [280 500 682],'name','Srednji');
fis = addMF(fis,'Troskovi_izgradnje','trimf',  [650 850 1000],'name','Veliki');


fis = addOutput(fis,[0 1000],'name','Ocjena');
fis = addMF(fis,'Ocjena','trimf',   [0 125.5 250],'name','Losa');
fis = addMF(fis,'Ocjena','trimf',  [200 350 500],'name','Srednja');
fis = addMF(fis,'Ocjena','trimf',   [450 610 750],'name','Prosjecna');
fis = addMF(fis,'Ocjena','trimf',   [700 853.1 1000],'name','Dobra');

fis = addOutput(fis,[0 1000],'name','Kupovina');
fis = addMF(fis,'Kupovina','trimf', [0 200 400],'name','NeKupiti');
fis = addMF(fis,'Kupovina','trimf', [350 550 750],'name','MozdaKupiti');
fis = addMF(fis,'Kupovina','trimf', [700 850 1000 1100],'name','Kupiti');

rules = [];
rulesIndex = 1;

for pov = 1:3 
    for cij = 1:3 
        for lok = 1:3
            for prik = 1:3 
                for izgr = 1:3 
                    if pov == 3 && cij == 1 && lok == 3 && prik == 1 && izgr == 1
                        ocjena = 4; 
                        kupovina = 3; 
                    elseif pov == 2 && cij == 2 && lok == 2 && prik <= 2 && izgr <= 2
                        ocjena = 3; 
                        kupovina = 2; 
                    elseif pov == 1 && cij == 3 && lok == 1 && prik == 3 && izgr == 3
                        ocjena = 1; 
                        kupovina = 1; 
                    else
                        ocjena = 2; 
                        kupovina = 1; 
                    end
                    rules(rulesIndex,:) = [pov cij lok prik izgr ocjena kupovina 1 1];
                    rulesIndex = rulesIndex + 1;
                end
            end
        end
    end
end

fis = addRule(fis,rules);        


mfedit(fis);
