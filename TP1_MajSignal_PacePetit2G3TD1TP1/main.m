%% Project Random Signal Processing

% Constantes
N=512; %Nombre d'échantillons
Fe=4400; %Freq échantillonage
var=0.5; %Variance de whitenoise
a=0.5; %Paramètre autorégressif
freq=440; %Freq sinus
p=200;
Nu0=sqrt(2)/8;


%Data échantillon
BruitB= genBB(N, var);
Ar1=genAR(N,a,var,10);
SWave1=genSW(N,a,freq,Fe);
SWave2=genSW(N,a,freq,Fe);
SWave3=genSW(N,a,freq,Fe);


%Computation Bruit Blanc
gam_wn=BiasedCrossCorr(BruitB,N);
gam_wnUnb=UnbiasedCrossCorr(BruitB,N);
%Bruit Blanc Réel
gam_wnR=zeros(1,N);
gam_wnR(1,p+1)=var;

%Computation de AR1
gam_AR1=BiasedCrossCorr(Ar1,N);
gam_AR1Unb=UnbiasedCrossCorr(Ar1,N);
%Réel de AR1
gam_AR1R=zeros(1,N);
for i=1:N
    gam_AR1R(1,i)=var*(a^i)/(1-a^2);
end

%computation de Sinus
gam_SWave1=BiasedCrossCorr(SWave1,N);
gam_SWave1Unb=UnbiasedCrossCorr(SWave1,N);
%Réel Sinus
gam_SWave1R=zeros(1,N);
for i=1:N
    gam_SWave1R(1,i)=((a^2)/2)*cos(2*pi*(freq/Fe)*i);
end 

%PSDC
Sin1=genSW(N,2,sqrt(2),8);
[PSDsinC, NusinC] = psdEstimatorC(Sin1, 500);
[PSDPsinP,NusinP] = psdEstimatorP(Sin1,500);
Bruit1=genBB(N,var);
[PSDBruitC, NuBruitC] = psdEstimatorC(Bruit1, 500);
[PSDPBruitP,NuBruitP] = psdEstimatorP(Bruit1,500);
Ar1Test= genAR(N,a,var,1);
[PSDARC, NuARC] = psdEstimatorC(Ar1Test, 500);
[PSDPARP,NuARP] = psdEstimatorP(Ar1Test,500);



%Moyennage BB et Sin depahasé
[PSDsinC1, NusinC1] = psdEstimatorC(Sin1,500, 1);
[PSDsinC2, NusinC2] = psdEstimatorC(Sin1,500, 4);
[PSDsinC3, NusinC3] = psdEstimatorC(Sin1,500, 7);

[PSDBruitC1, NuBruitC1] = psdEstimatorC(Bruit1,500, 1);
[PSDBruitC2, NuBruitC2] = psdEstimatorC(Bruit1,500, 20);
[PSDBruitC3, NuBruitC3] = psdEstimatorC(Bruit1,500, 500);

[PSDAR1C1, NuAR1C1] = psdEstimatorC(Ar1Test,500, 1);
[PSDAR1C2, NuAR1C2] = psdEstimatorC(Ar1Test,500, 20);
[PSDAR1C3, NuAR1C3] = psdEstimatorC(Ar1Test,500, 50);

YuleWalkerSolver(gam_wn,1);
YuleWalkerSolver(gam_AR1,1);
YuleWalkerSolver(gam_SWave1,2);

%[son1, Fe1] = audioread("./data/193309__margo-heston__ooo.flac");

%son1 = son1.';
%son1 = son1(1, :);
%son1 = son1(600 : N+599)

%Cx1 = UnbiasedCrossCorr(son1);

%bool1 = isVoiced(Cx1,Fe);

%K1 = 10 ;
%K2 = 30 ;
%[a1, v1] = YuleWalkerSolver(Cx1, K1);
%[a2, v2] = YuleWalkerSolver(Cx1, K2);

%Son1EstimK1 = filter(a1, 1, son1);
%Son1EstimK2 = filter(a2, 1, son1);
%Plot;