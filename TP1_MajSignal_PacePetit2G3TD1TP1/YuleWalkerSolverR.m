function [a,v] = YuleWalkerSolverR(Cx,K)
%YULEWALKERSOLVER Summary of this function goes here
%   Detailed explanation goes here

%% Calcul Gamma
Gamma= toeplitz(Cx(1:K));
%% Calcul ap
p=Cx(2:K+1).';
a = inv(Gamma)*p;
%% Autocorrélation
v= Cx(1)-conj(p).'*a;



