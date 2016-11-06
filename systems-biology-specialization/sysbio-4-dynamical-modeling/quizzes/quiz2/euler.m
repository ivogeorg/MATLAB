% % Use Euler's method to integrate simple one variable ODE
% % Use program as template for more interesting models

% % Note:  produces slightly different output compared with 
% % example shown in class.  Different values of b, dt, tlast

%a = 20 ;
%b = 0.5 ;
%c = 5 ;

% system constants
Vin = 0.36 ;
k1 = 0.02 ;
kp = 6 ;
Km = 13 ;

% initial conditions
ATP0 = 4 ;
G0 = 3 ;
 
dt    = 0.2 ;  
tlast = 1000 ; % s
 
iterations = round(tlast/dt) ; 
%xall = zeros(iterations,1) ;
ATPall = zeros(iterations, 1) ; 
Gall = zeros(iterations, 1) ;

%x = c ;
ATP = ATP0 ;
G = G0 ;
for i = 1:iterations 
  %xall(i) = x ;
  ATPall(i) = ATP ;
  Gall(i) = G ;
  %dxdt = a - b*x ;
  dATPdt = 2*k1*G*ATP - kp*ATP/(ATP + Km) ;
  dGdt = Vin - k1*G*ATP ;
  %x = x + dxdt*dt ;
  ATP = ATP + dATPdt*dt ;
  G = G + dGdt*dt ;
end % of this time step

time = dt*(0:iterations-1)' ;
figure
subplot(2, 1, 1)
plot(time,ATPall, time, Gall)
subplot(2, 1, 2)
plot(Gall, ATPall)