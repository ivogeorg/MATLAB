% % Rate-balance plots
% % 
% % 1) Backward rate saturation, varying S
% % 

close all
clear all

Astar = 0:0.01:1 ;
S = 0.05:0.05:3.5 ;
%S = 0 ;
kplus = 0.5 ;
kfs = 30 ;
%Kmb = 0.05:0.05:3.2 ;
Kmb = 0.5 ;
kminus = 5 ;
h = 4 ; % exponent

%BR = kminus*Astar ;
BR = kminus*(Astar./(Astar+Kmb)) ; % BR saturation
%FR = (kplus*S+kfs*Astar).*(1-Astar) ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  %FR = (kplus*S+kfs*Astar).*(1-Astar) ;
  %FR = (kplus*S+kfs*(Astar.^h./(Astar.^h+Kmf(i)^h))).*(1-Astar) ;
  %BR = kminus*(Astar./(Astar+Kmf(i))) ; % BR saturation
  FR = (kplus*S(i)+kfs*Astar).*(1-Astar) ;
  figure(handle1)
  plot(Astar,FR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(S(i),Astar(crossings),'bo')
  
end

figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')


% % Rate-balance plots
% % 
% % 2) Backward rate saturation, varying Kmf
% % 

% close all
% clear all
% 
% Astar = 0:0.01:1 ;
% %S = 0:0.02:0.5 ;
% S = 0 ;
% kplus = 2 ;
% kfs = 30 ;
% Kmb = 0.05:0.05:3.2 ;
% kminus = 5 ;
% h = 4 ; % exponent
% 
% %BR = kminus*Astar ;
% FR = (kplus*S+kfs*Astar).*(1-Astar) ;
% figure
% handle1 = gcf ;
% hold on 
% plot(Astar,FR,'b','LineWidth',2)
% set(gca,'TickDir','Out')
% 
% figure
% handle2 = gcf ;
% hold on
% 
% for i=1:length(Kmb)
%   %FR = (kplus*S+kfs*Astar).*(1-Astar) ;
%   %FR = (kplus*S+kfs*(Astar.^h./(Astar.^h+Kmf(i)^h))).*(1-Astar) ;
%   BR = kminus*(Astar./(Astar+Kmb(i))) ; % BR saturation
%   figure(handle1)
%   plot(Astar,BR,'r','LineWidth',2)
%   
%   crossings = [] ;
%   difference = FR-BR ;
%   for iii=2:length(FR)
%     if (sign(difference(iii)) ~= sign(difference(iii-1)))
%       crossings = [crossings,iii] ;
%     end
%   end
%   figure(handle2)
%   plot(Kmb(i),Astar(crossings),'bo')
%   
% end
% 
% figure(handle1)
% axis([0 1 0 max(FR)])
% set(gca,'TickDir','Out')
% xlabel('[A*]/[A]')
% ylabel('Rates')
% 
% figure(handle2)
% set(gca,'TickDir','Out')
% xlabel('Kmb')
% ylabel('Steady-state [A*]/[A]')

