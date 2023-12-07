function [PSD,nu] = psdEstimatorP (X,Nfft)
N=length(X);
if (Nfft<2*N)
    Nfft=2*N;
end

nu=0:1/Nfft:1/2;
Xfourier=fft(X,Nfft);
PSD=(1/N)*abs(Xfourier).^2;
PSD=PSD(1:length(nu));