function sliderSIR
f=figure('visible','off','position',...
    [360 500 600 400]);
slhan=uicontrol('style','slider','position',[130 350 300 20],...
    'min',0,'max',10);
hsttext=uicontrol('style','text',...
    'position',[450 355 55 15],'visible','off');
hSliderListener = addlistener(slhan, 'Value', 'PostSet', @callbackfn);
axes('units','pixels','position',[100 50 400 300]);
movegui(f,'center')
set(f,'visible','on');
    function callbackfn(source,eventdata)
        Rt=get(slhan,'value');
        set(hsttext,'visible','on','string',strcat('R0=',num2str(Rt)))
        Tinf=2.9;
        unitsperday=1;
        tspan = [0 450]*unitsperday;%[0 23]*unitsperday;
        N=3e6;
        y0 = [1 1 0];
        y0(1)=N;
        opts = odeset('Reltol',1e-14,'AbsTol',1e-14,'Stats','on');
        [t,y] = ode113(@(t,y) sir(t,y,Rt,Tinf,unitsperday,N), tspan, y0,opts);
        plot(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
        %semilogy(t,y(:,1),'--',t,y(:,2),'-.',t,y(:,3),'-.',t,y(:,3)*0.01,'-');
        %ax=gca;
        %ax.XLim=[0 2*pi]
        hleg1=legend('S: Sains, Susceptibles','I: Infectés, Contagieux','R: Retirés (guéri ou décédé)','décès modélisés=0.01R');
        set(hleg1,'Location','NorthWest');
        xlabel('temps (jours)','fontsize',14)
        ylabel('nombre','fontsize',14)
        %ylim([0 3e6]);
        ylim([1e-2 3e6]);
        
    end
end