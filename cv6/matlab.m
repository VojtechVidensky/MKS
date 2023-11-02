clear all
close all

values = csvread('ntc.csv');
ad = values(:,1);
t = values(:,2);

figure
t = 1023*t./(10*ones(size(t))+t);
ad2 = 0:1023;
plot(t, ad,'o')
p = polyfit(t, ad, 10);
t2 = round(polyval(p, ad2), 1);
hold on
plot(ad2, t2, 'r')
xlabel('ADC Value')
ylabel('Temperature °C')

dlmwrite('data.dlm', t2*10, ',')
