% PERKIRAAN WAKTU TEMPUH
v    = 0.6;          % Kecepatan maks Mach
va   = 343;          % Kecepatan suara di udara pada temp 20 C (m/s)
v    = v*va;
S    = 2e5;          % Jarak maks
tmax = S/v;          % Estimasi waktu tempuh maks (detik)

m_full  = 340;             % Massa total rudal
m_boost = 54;              % Massa booster
m_init  = m_full-m_boost;  % Massa tanpa booster

% PERKIRAAN PENGURANGAN MASSA BAHAN BAKAR
rho_fuel = 800;     % kgm-3 (avtur, wikipedia)
Q        = 5e-5;    % debit fuel liter/detik
m_fuel   = tmax*Q*rho_fuel;
m_end    = m_init-m_fuel;
dmdt     = -m_fuel/tmax;

boost   = 30000;        % F booster (N)
thrust  = 910;          % F thruster (N)
Lref    = 3.675;        % From CFD (m)
dref    = 0.28;         % Estimasi (m)
Sref    = 0.1711917;    % From CFD (m)
I_init      = zeros(3,3);
I_init(1,1) = (1/8)*m_init*dref^2;
I_init(2,2) = (1/12)*m_init*Lref^2+(1/16)*m_init*dref^2;
I_init(3,3) = (1/12)*m_init*Lref^2+(1/16)*m_init*dref^2;
I_init = 1*I_init;

I_end       = zeros(3,3);
I_end(1,1)  = (1/8)*m_end*dref^2;
I_end(2,2)  = (1/12)*m_end*Lref^2+(1/16)*m_end*dref^2;
I_end(3,3)  = (1/12)*m_end*Lref^2+(1/16)*m_end*dref^2;
I_end = 1*I_end;

wn_act = 150;           % wn motor fin, makin besar makin bagus
z_act  = 0.707;         % zeta motor fin
tau    = 0.04;
fmax   = (10/180)*pi;   % defleksi sirip maksimum
C3to4  = [1 -1 1;1 1 1;-1 1 1;-1 -1 1];
C4to3  = (1/4)*[1 1 -1 -1;-1 1 1 -1;1 1 1 1];
            
%% Aerodynamic Coefficient of C-705 from CFDv2
load C705CFDv2.mat;

% Disable Forces or Moments
% C(1:8)   = 0; % FX
% C(9:16)  = 0; % FY
% C(17:24) = 0; % FZ
% C(25:32) = 0; % MX
% C(33:40) = 0; % MY
% C(41:48) = 0; % MZ

C(49) = -0.2; % CMYq
C(50) = -0.5; % CMZr
C(51) = -0.01; % CMXp