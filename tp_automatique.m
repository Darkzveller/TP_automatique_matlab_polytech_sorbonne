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
% Premiere Partie
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
% F

% Question 4 
[Gm, Pm, Wcg, Wcp] = margin(T);
% Gm
% Pm
% Wcg
% Wcp
margin(T);
grid on;
%%
% Question 5 
step(5*F,600);
grid on;

% Consigne de température
consigne = 5;

% Valeur finale de la sortie
theta_final = dcgain(F) * consigne;

% Erreur de position en Kelvin
erreur = consigne - theta_final;

% Erreur de position en pourcentage
erreur_pourcent = (erreur / consigne) * 100;

% Affichage des résultats
fprintf('Température finale : %.4f K\n', theta_final);
fprintf('Erreur de position : %.4f K\n', erreur);
fprintf('Erreur de position : %.2f %%\n', erreur_pourcent);


% Question 6
erreur = 0.05; % Erreur relative souhaitée : 5 %

K5 = (1/erreur - 1) / dcgain(Ka*Kt*Ge);

T5 = K5*Ka*Kt*Ge;
F5 = feedback(T5,1);

% Affichage du gain calculé
fprintf('K5 : %.4f \n', K5);
% Réponse à un échelon de 5 K
step(5*F5,600);
grid on;

% Question 7 

nyquist(T5);
grid on;

% Question 8 
margin(T5);
grid on;