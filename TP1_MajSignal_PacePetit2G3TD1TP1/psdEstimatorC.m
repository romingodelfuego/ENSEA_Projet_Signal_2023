function [PSD,nu] = psdEstimatorC(X,Nfft)
N=length(X);
if (Nfft<2*N)
    Nfft=2*N;
end

nu=0:1/Nfft:1/2;
Cx=BiasedCrossCorr(X);
PSD=fft(Cx,Nfft);

PSD=2*real(PSD)-Cx(1);
PSD=PSD(1:length(nu));

