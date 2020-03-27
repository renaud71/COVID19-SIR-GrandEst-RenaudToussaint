Rt=2.1;
Tinf=2.9;
unitsperday=1;
tspan = [0 23]*unitsperday;%[0 23]*unitsperday;
N=3e6;
y0 = [1 1 0];
y0(1)=N;
opts = odeset('Reltol',1e-14,'AbsTol',1e-14,'Stats','on');
[t,y] = ode113(@(t,y) sir(t,y,Rt,Tinf,unitsperday,N), tspan, y0,opts);
Rt=1.4;
 y0=y(end,:);
 tspan = [23 150]*unitsperday;
 [t1,y1] = ode113(@(t,y) sir(t,y,Rt,Tinf,unitsperday,N), tspan, y0,opts);

vic=[2 3 4 5 9 21 24 45 51 61 93 105 230 271 335 407 507 580];
hospi=[1169 1551 1767 1977 2348 2722 3068 3292];
rea=[300 352 435 480 526 595 651 701];
sorties=[213 284 357 402 491 961];
datemars=[7 8 9 10 11 13 14 15 16 17 19 20 21 22 23 24 25 26];
datemarshospirea=[19 20 21 22 23 24 25 26];
datemarssorties=[19 20 21 22 23 26];
figure;
plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
hold on;
plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-');
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
semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-');
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
plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-',t1,y1(:,2)*0.15,t1,y1(:,2)*0.15*0.225);
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
plot(datemarshospirea+7,hospi,'-.+');
plot(datemarshospirea+7,rea,'--+k');
plot(datemarssorties+7,sorties,'-+');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([0 4500]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

figure;
semilogy(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');%t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-');
hold on;
semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-',t1,y1(:,2)*0.15,t1,y1(:,2)*0.15*0.225);
%semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%semilogy(datemars-2,vic,'-o');
semilogy(datemars+7,vic,'-o');
semilogy(datemarscasconf+7,casconf,'-ok');
semilogy(datemarshospirea+7,hospi,'-.+');
semilogy(datemarshospirea+7,rea,'--+k');
semilogy(datemarssorties+7,sorties,'-+');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([1 4500]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

Rt=2.1;
Tinf=2.9;
unitsperday=1;
tspan = [0 23]*unitsperday;%[0 23]*unitsperday;
N=3e6;
y0 = [1 1 0];
y0(1)=N;
opts = odeset('Reltol',1e-14,'AbsTol',1e-14,'Stats','on');
[t2,y2] = ode113(@(t2,y2) sir(t2,y2,Rt,Tinf,unitsperday,N), tspan, y0,opts);
Rt=1.4;
 y0=y2(end,:);
 tspan = [23 33]*unitsperday;
 [t3,y3] = ode113(@(t3,y3) sir(t3,y3,Rt,Tinf,unitsperday,N), tspan, y0,opts);
Rt=0.95; 
 y0=y3(end,:);
 tspan = [33 150]*unitsperday;
 [t4,y4] = ode113(@(t4,y4) sir(t4,y4,Rt,Tinf,unitsperday,N), tspan, y0,opts);

 figure;
plot(t2,y2(:,1),'--',t2,y2(:,2),'-.',t2,y2(:,3),'-.',t2,y2(:,3)*0.01,'-');
hold on;
plot(t3,y3(:,1),'--',t3,y3(:,2),'-.',t3,y3(:,3),'-.',t3,y3(:,3)*0.01,'-',t3,y3(:,2)*0.15,t3,y3(:,2)*0.15*0.225);
plot(t4,y4(:,1),'--',t4,y4(:,2),'-.',t4,y4(:,3),'-.',t4,y4(:,3)*0.01,'-',t4,y4(:,2)*0.15,t4,y4(:,2)*0.15*0.225);
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
plot(datemarshospirea+7,hospi,'-.+');
plot(datemarshospirea+7,rea,'--+k');
plot(datemarssorties+7,sorties,'-+');
xlim([0 100]);
set(gca,'XTick',0:1:200);
ylim([0 10000]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

figure;
semilogy(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');%t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-');
hold on;
semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-',t1,y1(:,2)*0.15,t1,y1(:,2)*0.15*0.225);
%semilogy(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%semilogy(datemars-2,vic,'-o');
semilogy(datemars+7,vic,'-o');
semilogy(datemarscasconf+7,casconf,'-ok');
semilogy(datemarshospirea+7,hospi,'-.+');
semilogy(datemarshospirea+7,rea,'--+k');
semilogy(datemarssorties+7,sorties,'-+');
xlim([0 31]);
set(gca,'XTick',0:1:200);
ylim([1 4500]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

 figure;
plot(t2,y2(:,1),'--',t2,y2(:,2),'-.',t2,y2(:,3),'-.',t2,y2(:,3)*0.01,'-');
hold on;
plot(t3,y3(:,1),'--',t3,y3(:,2),'-.',t3,y3(:,3),'-.',t3,y3(:,3)*0.01,'-',t3,y3(:,2)*0.15,t3,y3(:,2)*0.15*0.225);
plot(t4,y4(:,1),'--',t4,y4(:,2),'-.',t4,y4(:,3),'-.',t4,y4(:,3)*0.01,'-',t4,y4(:,2)*0.15,t4,y4(:,2)*0.15*0.225);
plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
hold on;
plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-',t1,y1(:,2)*0.15,t1,y1(:,2)*0.15*0.225);
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
plot(datemarshospirea+7,hospi,'-.+');
plot(datemarshospirea+7,rea,'--+k');
plot(datemarssorties+7,sorties,'-+');
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
plot(datemarshospirea+7,hospi,'-.+');
plot(datemarshospirea+7,rea,'--+k');
plot(datemarssorties+7,sorties,'-+');
xlim([0 100]);
set(gca,'XTick',0:1:200);
ylim([0 10000]);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)

 figure;
%plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
plot(t2,y2(:,1),'--',t2,y2(:,2),'-.',t2,y2(:,3),'-.',t2,y2(:,3)*0.01,'-');
hold on;
plot(t3,y3(:,1),'--',t3,y3(:,2),'-.',t3,y3(:,3),'-.',t3,y3(:,3)*0.01,'-',t3,y3(:,2)*0.15,t3,y3(:,2)*0.15*0.225);
plot(t4,y4(:,1),'--',t4,y4(:,2),'-.',t4,y4(:,3),'-.',t4,y4(:,3)*0.01,'-',t4,y4(:,2)*0.15,t4,y4(:,2)*0.15*0.225);

%hold on;
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-.',t1,y1(:,3)*0.01,'-',t1,y1(:,2)*0.15,t1,y1(:,2)*0.15*0.225);
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
plot(datemars+7,vic,'-o');
plot(datemarscasconf+7,casconf,'-ok');
plot(datemarshospirea+7,hospi,'-.+');
plot(datemarshospirea+7,rea,'--+k');
plot(datemarssorties+7,sorties,'-+');
%plot(t1,y1(:,1),'--',t1,y1(:,2),'-.',t1,y1(:,3),'-');
%plot(datemars-2,vic,'-o');
% plot(datemars+7,vic,'-o');
% plot(datemarscasconf+7,casconf,'-ok');
% plot(datemarshospirea+7,hospi,'-.+');
% plot(datemarshospirea+7,rea,'--+k');
% plot(datemarssorties+7,sorties,'-+');
xlim([0 100]);
set(gca,'XTick',0:5:200);
ylim([0 23000]);
set(gca,'YTick',0:1000:23000);
%hleg1=legend('S','I','R','','','','décès COVID 19, ARS');
hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R','','','','','hospitalisations modélisées=0.15 I','réanimations modélisées=015*0.225 I','','','','','','','données, décès COVID 19, ARS', 'données, cas confirmés, ARS','données, hospitalisations, ARS','données, réanimations, ARS', 'données, sorties d hopital stables, ARS');
set(hleg1,'Location','NorthWest');
annotation('textbox', [.46 0.13 .08 .06], 'String', '7 Mars ');
xlabel('temps (jours)','fontsize',14)
ylabel('nombre','fontsize',14)