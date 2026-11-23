L=0.4;
Rs=0.015;
Rb=0.03;
ws=1/40;
wb=1/180;

ms=1000*pi*Rs^2*L;
mb=1000*pi*(Rb^2-Rs^2)*L;
cs=4185;
cb=cs;
hb=100;

S=2*pi*Rs*L;
alphas=2*ws/ms;
betas=hb*S/ms/cs;
sigmas=alphas+betas;

alphab=2*wb/mb;
betab=hb*S/mb/cb;
sigmab=alphab+betab;
Kt=0.05;
Ka=2.5;
%% Premiere Partie
% Question 1
p = tf('p');
Ge = (2*alphas*betab)/(p^2+(sigmas+sigmab)*p+sigmas*sigmab-betas*betab);
% Ge
% Question 2
K0 = 1;
T = K0*Ka*Kt*Ge;
% T

% Question 3
F = feedback(T,1);
F