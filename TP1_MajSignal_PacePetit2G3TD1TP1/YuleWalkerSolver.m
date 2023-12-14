function [a,v] = YuleWalkerSolver(Cx,K)
if (nargin()==1 || K>length(Cx))
    K=length(Cx)-1;
end

colonne=Cx(1:K);
Ligne=conj(Cx(1:K));

Mat=toeplitz(colonne,Ligne);

p=Cx(2:K+1).';
a = inv(Mat)*p

v=Cx(1)-(conj(p).'*inv(Mat)*(p))