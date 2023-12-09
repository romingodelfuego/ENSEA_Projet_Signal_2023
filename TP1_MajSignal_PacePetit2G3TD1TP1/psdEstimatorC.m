function [PSD,nu] = psdEstimatorC(X,Nfft,varargin)

if ~isempty(varargin)
    K=varargin{1};
else 
    K=0;
end


N=length(X);
if (Nfft<2*N)
    Nfft=2*N;
end

nu=0:1/Nfft:1/2;
Cx=BiasedCrossCorr(X);
PSD=fft(Cx,Nfft);
PSD=2*real(PSD)-Cx(1);

if K~=0
    for nb=1:round(N/K) %%Nombre de fenetre
        PSD(1+K*(nb-1):K*nb) = sum(PSD(1+K*(nb-1):K*nb))/K;
    end
end

PSD=PSD(1:length(nu));
end





