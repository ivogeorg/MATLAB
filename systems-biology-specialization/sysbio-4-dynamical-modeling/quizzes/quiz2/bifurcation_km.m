% % Use Euler's method to integrate simple one variable ODE
% % Use program as template for more interesting models

% % Note:  produces slightly different output compared with 
% % example shown in class.  Different values of b, dt, tlast


% system constants
Vin = 0.36 ;
k1 = 0.02 ;
kp = 6 ;
%Km = 13 ;

% initial conditions
ATP0 = 4 ;
G0 = 3 ;
 
dt    = 0.05 ;  
tlast = 2000 ; % s
 
iterations = round(tlast/dt) ;
KM = 1:20 ;
ATPmax = zeros(length(KM), 1) ;
ATPmin = zeros(length(KM), 1) ;
Gmax = zeros(length(KM), 1) ;
Gmin = zeros(length(KM), 1) ;

for j = 1:length(KM)
    Km = KM(j) ;
    ATPall = zeros(iterations, 1) ; 
    Gall = zeros(iterations, 1) ;

    ATP = ATP0 ;
    G = G0 ;
    for i = 1:iterations 
      ATPall(i) = ATP ;
      Gall(i) = G ;

      dATPdt = 2*k1*G*ATP - kp*ATP/(ATP + Km) ;
      dGdt = Vin - k1*G*ATP ;

      ATP = ATP + dATPdt*dt ;
      G = G + dGdt*dt ;
    end % of this time step
    
    % get max and min
    ATPmax(j) = max(ATPall(round(iterations/2):iterations)) ;
    ATPmin(j) = min(ATPall(round(iterations/2):iterations)) ;
    Gmax(j) = max(Gall(round(iterations/2):iterations)) ;
    Gmin(j) = min(Gall(round(iterations/2):iterations)) ;

end % this value of Vin

% plot results
figure
subplot(2, 1, 1)
plot(KM,ATPmax, KM, ATPmin)
title('Bifurcation in ATP/Km')
subplot(2, 1, 2)
plot(KM,Gmax, KM, Gmin)
title('Bifurcation in Glucose/Km')
