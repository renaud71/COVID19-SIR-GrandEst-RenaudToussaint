function dydt = sir(t,y,Rt,Tinf,unitsperday,N)
dydt = zeros(3,1);
dydt(1) = -(Rt/Tinf)*y(2)*y(1)/N;
dydt(2) = (Rt/Tinf)*y(2)*y(1)/N -(1/Tinf)*y(2);
dydt(3) = (1/Tinf)*y(2);
dydt=dydt/unitsperday;
end