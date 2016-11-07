% Plotting nullcliness for E.coli lac operon

clear all
close all

p = 4 ;
gamma = 1 ;
beta = 1 ;
delta = 0.2 ;
sigma = 1 ;
l_ext = 2.5 ;
l0 = 4 ;

l = 0:0.1:12 ;

lnullc = gamma*l / (beta * l_ext) ;
lacnullc = (delta + p * (l.^4./(l.^4 + l0^4)))/sigma ;

%plot(l, lnullc, l, lacnullc)
plot(l, lnullc)
hold on

plot(l, lacnullc, '--')
hold off

legend('l', 'LacY')

title('LacY vs l')
xlabel('l')
ylabel('LacY')
