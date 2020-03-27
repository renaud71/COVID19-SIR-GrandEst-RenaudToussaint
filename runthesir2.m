Rt=2.1;
Tinf=2.9;
unitsperday=1;
tspan = [0 150]*unitsperday;%[0 23]*unitsperday;
N=3e6;
y0 = [1 1 0];
y0(1)=N;
opts = odeset('Reltol',1e-14,'AbsTol',1e-14,'Stats','on');
[t,y] = ode113(@(t,y) sir(t,y,Rt,Tinf,unitsperday,N), tspan, y0,opts);
%Rt=2;
% y0=y(end,:);
% tspan = [23 150]*unitsperday;
% [t1,y1] = ode113(@(t,y) sir(t,y,Rt,Tinf,unitsperday,N), tspan, y0,opts);

vic=[2 3 4 5 9 21 24 45 51 61 93 105 230 271 335 407];
datemars=[7 8 9 10 11 13 14 15 16 17 19 20 21 22 23 24];

figure;
plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
hold on;
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([0 1000]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','décès COVID 19, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .04], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

figure;
semilogy(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');%t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-');
hold on;
%semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%semilogy(datemars-2,vic,'-o');
semilogy(datemars+7,vic,'-o');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([1 1000]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','décès COVID 19, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

casconf=[1 7 26 262 310 464 587 910 1085 1378 1543 1820];
datemarscasconf=[-4 2 4 8 9 10 11 13 14 15 16 17];

figure;
plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
hold on;
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([0 4500]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','données, décès COVID 19, ARS', 'données, cas confirmés, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

figure;
semilogy(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');%t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-');
hold on;
%semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%semilogy(datemars-2,vic,'-o');
semilogy(datemars+7,vic,'-o');
semilogy(datemarscasconf+7,casconf,'-ok');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([1 4500]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','décès COVID 19, ARS','données, cas confirmés, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)