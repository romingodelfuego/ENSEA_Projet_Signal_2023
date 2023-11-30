%%genSW function
function outp = genSW(N,a,f,Fe)
    phase=2*pi*rand();
    t=0:(N-1);
    outp=a*sin(2*pi*(f/Fe)*t+phase);
end