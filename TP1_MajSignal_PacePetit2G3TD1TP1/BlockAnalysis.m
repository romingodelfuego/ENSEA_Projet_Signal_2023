function [pitch,sigma2,Aopt] = BlockAnalysis(X,M,Fe)
Nfft=length(X);
%% Bloc Estimateur d'autocorrélation
[Cx,~] = psdEstimatorC(X,Nfft); %Peut etre ajouter ici une taille de fenetre selon Fe

%% Bloc Détermination de la source
FHumain= [100,400];
pitch = PitchDetector(Cx,Fe,FHumain(1),FHumain(2));

%% Bloc Prédiction Linéaire
[Aopt,sigma2]=YuleWalkerSolver(Cx,M);

end