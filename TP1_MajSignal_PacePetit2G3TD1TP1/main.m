%% Project Random Signal Processing
%%


% Constantes
N=512; %Nombre d'échantillons
Fe=44100; %Freq échantillonage
var=0.5; %Variance de whitenoise
a=0.8; %Paramètre autorégressif
freq=440; %Freq sinus
p=200;
Nu0=sqrt(2)/8;


%Data échantillon
BruitB= genBB(N, var);
Ar1=genAR1(N,a,1);
SWave1=genSW(N,1,freq,Fe);
SWave2=genSW(N,1,freq,Fe);
SWave3=genSW(N,1,freq,Fe);



%Computation Bruit Blanc
gam_wn=BiasedCrossCorr(BruitB,p);
gam_wnUnb=UnbiasedCrossCorr(BruitB,p);
%Bruit Blanc Réel
gam_wnR=zeros(1,N);
gam_wnR(1,p+1)=var;

%Computation de AR1
gam_AR1=BiasedCrossCorr(Ar1,p);
gam_AR1Unb=UnbiasedCrossCorr(Ar1,p);
%Réel de AR1
gam_AR1R=zeros(1,N);
for i=1:N
    gam_AR1R(1,i)=var*(a^i)/(1-a^2);
end

%computation de Sinus
gam_SWave1=BiasedCrossCorr(SWave1,p);
gam_SWave1Unb=UnbiasedCrossCorr(SWave1,p);
%Réel Sinus
gam_SWave1R=zeros(1,N);
for i=1:N
    gam_SWave1R(1,i)=((a^2)/2)*cos(2*pi*(freq/Fe)*i);
end 

%PSDC
Sin1=genSW(N,2,sqrt(2),8);
[PSDsin, Nusin] = psdEstimatorC(Sin1, 500);
[PSDPsin,Nusin2] = psdEstimatorP(Sin1,500);
Bruit1=genBB(N,var);
[PSDBruit, NuBruit] = psdEstimatorC(Bruit1, 500);
[PSDPBruit,NuBruit2] = psdEstimatorP(Bruit1,500);
Ar1Test= genAR1(N,a,var);
[PSDAR1, NuAR1] = psdEstimatorC(Ar1Test, 500);
[PSDPAR1,NuAR2] = psdEstimatorP(Ar1Test,500);

