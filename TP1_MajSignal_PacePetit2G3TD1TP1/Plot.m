%Affichage
figure(1)
subplot(311)
stem(BruitB);
legend('White Noise');
xlabel('Echantillon');
ylabel('Amplitude');
title('Plot du bruit blanc');

subplot(312)
stem(Ar1);
legend('AR1 signal');
xlabel('Echantillon');
ylabel('Amplitude');
title('Plot de AR1');

subplot(313)
hold on;
stem(SWave1);
stem(SWave2);
stem(SWave3);
legend('Sinus à phase aléatoire');
xlabel('Echantillon');
ylabel('Amplitude');
title('Plot de Sinus à phase aléatoire');

figure(2)
hold on
stem(gam_wn);
stem(gam_wnUnb);
%stem(gam_wnR);
hold off
legend('Estimateur Autocorrelation biaisé','Estimateur Unbiased autocorrelation');
xlabel('p'); 
ylabel('Autocorrelation');
title('Comparaison entre l estimateur unbiased and biased de l autocorrellation pour le bruit blanc');

figure(3)
hold on
stem(gam_AR1);
stem(gam_AR1Unb);
%stem(gam_AR1R);
hold off
legend('Estimateur Autocorrelation biaisé','Estimateur Unbiased autocorrelation');
xlabel('p'); 
ylabel('Autocorrelation');
title('Comparaison entre l estimateur unbiased and biased de l autocorrellation pour AR1');

figure(4)
hold on
stem(gam_SWave1);
stem(gam_SWave1Unb);
%stem(gam_SWave1R)
hold off
legend('Estimateur Autocorrelation biaisé','Estimateur Unbiased autocorrelation');
xlabel('p'); 
ylabel('Autocorrelation');
title('Comparaison entre l estimateur unbiased and biased de l autocorrellation pour le sinus avec phase aléatoire');

figure(5)

% Import Voice or Not Voice
file_path = './data/voise_oo.flac';
[y_song,fe]=audioread(file_path);
y = fft(y_song);
x =linspace(0,fe,length(y_song));
plot(x,abs(y));

figure (6)
hold on
plot(Nusin, PSDsin)
plot(Nusin, PSDPsin)
hold off
xlabel("fréquence réduite Nu")
ylabel("Amplitude")
title("Estimation de la DSP")
legend("Corrélogramme", "Périodogramme");
hold off


figure (7)
hold on
plot(NuBruit, PSDBruit)
plot(NuBruit2,PSDPBruit)
hold off
xlabel("fréquence réduite Nu")
ylabel("Amplitude")
title("Estimation de la DSP pour un bruit blanc")
legend("Corrélogramme", "Périodogramme");

figure (8)
hold on
plot(NuAR1, PSDAR1)
plot(NuAR2,PSDPAR1)
hold off
xlabel("fréquence réduite Nu")
ylabel("Amplitude")
title("Estimation de la DSP pour un AR1")
legend("Corrélogramme", "Périodogramme");
