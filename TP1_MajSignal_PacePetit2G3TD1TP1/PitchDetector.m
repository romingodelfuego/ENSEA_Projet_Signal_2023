function [pitch,bool = PitchDetector(Cx,Fe,Fmin,Fmax)

y=abs(fft(Cx));
[~,indiceOfMax]=max(y);
bool = x(indiceOfMax)>=Fmin && x(indiceOfMax)<=Fmax;
if bool
    pitch =indiceOfMax;
else 
    pitch =-1;
end
% IsVoiced pourrait etre utile mais plus simple de coder comme ca
end

