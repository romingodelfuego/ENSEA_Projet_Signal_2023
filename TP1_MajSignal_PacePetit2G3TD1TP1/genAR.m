%%genAR1 function
function outp = genAR(N,a,var,K)
    if nargin<4
        K=1;
    end

    WNoise=genBB(N,var);
    den=1;
    num=ones(1,K);
    
    for i=1:K
        num(i+1)=a(i);
    end 
    outp=filter(den,num,WNoise); 
end