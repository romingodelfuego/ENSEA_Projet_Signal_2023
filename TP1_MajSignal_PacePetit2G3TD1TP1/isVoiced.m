function bool = isVoiced(Cx)
err=0;
f_Humain=[100-err,400+err];
% Import Voice or Not Voice
file_path = './data/nonvoise_th.flac';
[y_song,fe]=audioread(file_path);

%% Méthode avec le spectre en fréquence %%
x =linspace(0,fe,length(y_song));
y=abs(fft(y_song));
[amplMax,indiceOfMax]=max(y);
bool = x(indiceOfMax)>=f_Humain(1) && x(indiceOfMax)<=f_Humain(2);

% Plot Intéressant
figure();
subplot(211);

hold on;
xPlot = x(1,1:round(length(x)/2));
yPlot=y(1:round(length(x)/2));
plot(xPlot,yPlot);
%Plot de décision
hachureX=[f_Humain(1),f_Humain(2),f_Humain(2),f_Humain(1)];
hachureY=[0,0,amplMax*1.2,amplMax*1.2];
patch(hachureX,hachureY,'r','EdgeColor','none','FaceAlpha',0.2);
text(x(indiceOfMax)+70,amplMax,sprintf('bool=%d',bool));%Plot text du resultat 
scatter(x(indiceOfMax),amplMax,'magenta','filled'); %Point du max retenue

subplot(212);
hold on;
plot(y_song,"Color","#0072BD");
xSin = 1:length(y_song);
delay= find(y_song(1:end-1) .*y_song(2:end)<0,1,'first')+1;
plot(sin(2*pi*x(indiceOfMax)*(xSin-delay)/fe),'Color','#D95319');
btn = uicontrol('Style','pushbutton','String','Inverser','Callback',@inverser,'UserData',2);
    function inverser(~,~)
        valActu = get(btn,'UserData');
        if mod(valActu,2)
            set(btn,'UserData',2);
            phase = 0;
            hold off;
            plot(y_song,"Color","#0072BD");        
            hold on;
            plot(sin(2*pi*x(indiceOfMax)*(xSin-delay)/fe +phase),'Color','#D95319');
            xlim([0,length(y_song)]);
            hold off;
        else
            set(btn,'UserData',1);
            phase = pi;
            hold off;
            plot(y_song,"Color","#0072BD");
            hold on;
            plot(sin(2*pi*x(indiceOfMax)*(xSin-delay)/fe +phase),'Color','#D95319');
            xlim([0,length(y_song)]);
            hold off;
        end
    end

xlim([0,length(y_song)]);
hold off;

end

