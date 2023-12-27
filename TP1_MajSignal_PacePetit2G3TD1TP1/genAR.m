%%genAR1 function
function outp = genAR(N,a,var,K)
    if nargin<4
        K=1;
    end

    WNoise=genBB(N,var);
    num=1;
    den=ones(1,K+1);
    
    for i=1:K
        den(i+1)=a(i);
    end 
    outp=filter(den,num,WNoise); 
end