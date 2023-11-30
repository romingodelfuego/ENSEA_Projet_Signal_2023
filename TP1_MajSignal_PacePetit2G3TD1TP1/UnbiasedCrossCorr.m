%% [Cx,p] = BiasedCrossCorr(X,pmax)
% Computation of the biased cross correlation of a given signal X.
%
% INPUTS
% - X vector of signal samples
% - pmax maximal amount of shift to be considered
% (optional, defaults to the length of X minus 1)
% OUTPUTS
% - Cx vector of cross correlation samples for shifts varying
% from 0 to pmax
% - p vector of corresponding shifts
function Cx = UnbiasedCrossCorr(X,pmax)
    %Constante
    N=length(X);
    
    %Si pmax non choisi
    if nargin<2
        pmax=length(X);
    end

    %Initialization de Cx et p vecteurs
    Cx=zeros(1,pmax);
    p=0:pmax-1;
    %Computation of Cx
    for k=1:pmax
        for i=k:N-1
            Cx(1,k)=Cx(1,k)+(X(1,i)*conj(X(1,i-k+1)));
        end
        Cx(1,k)=Cx(1,k)/(N-k);
    end

