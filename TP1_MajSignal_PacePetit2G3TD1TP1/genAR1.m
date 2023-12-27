%%genAR1 function
function outp = genAR1(N,a,var)
    WNoise=genBB(N,var);
    den=1;
    num=[1 -a]; 
    outp=filter(den,num,WNoise); 
end
