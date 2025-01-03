% G. Eaton 2019, 2022

% Vin = 1cos(2pi5000t)
Vin = 1; %phasor voltage
omega = 2*pi*5000;
%Rth = 10 ohms
Rth = 10;
%L = 10 mH
L = 1*10^-3;
%C = 1uF
C = 1*10^-6;

% ***USER: you can change the values of R load below from nominal to your measured
% values with and without the inductor resistance included
Rl = [14 51 104];
% Prompt for R values
%Rl = input('Enter a row vector with values for RL in Ohms:')

%compute load impedance
Zc = 1/(j*omega*C);
Zrl = Rl + (j*omega*L);

%***USER: for the no parallel capacitor case, the next line should be
%         uncommented - this is the default for this file
%Zl = Zrl;

%***USER: for parallel capacitor case (i.e. power factor modified), 
%         the next line should be uncommented, but also make sure 
%         the line above is commented out
Zl = (Zc.*Zrl)./(Zc+Zrl);


% compute total load seen from ideal Thevenin source Zeq = Rth + Zl
Zeq = Rth + Zl;

% compute Irms = Vrms/Zl = Vin/(sqrt(2)*Zl)
Im = Vin./Zeq;

Irms = Vin./(sqrt(2)*Zeq);

% compute Vrms for the load = Zl x Irms
Vlrms = Zl.* Irms;

% compute complex power S = VrmsIrms* from which to get average and apparent power
S = Vlrms.*conj(Irms);

% compute load average power from S
Plavg = real(S);

% compute load apparent power from S
Plapp = abs(S);

% compute power factor from power factor = Plavg/Plapp
power_factor = Plavg./Plapp;



% compute average power for Thevenin resistor = Irms x Irms* x Rth
P_Rth = Irms.*conj(Irms).*Rth;
PavgRth = real(P_Rth);


% compute ratio between the average power dissipated 
% by the resistor Rth and the average power delivered to the load.
ratio = PavgRth ./ Plavg;

              
% convert to polar coordinates
[t0,r0] = cart2pol(real(Rl),imag(Rl));
[t1,r1] = cart2pol(real(Irms),imag(Irms));    
[t2,r2] = cart2pol(real(Vlrms),imag(Vlrms));
[t3,r3] = cart2pol(real(Plavg),imag(Plavg));
[t4,r4] = cart2pol(real(S),imag(S));
[t5,r5] = cart2pol(real(power_factor),imag(power_factor));
[t6,r6] = cart2pol(real(PavgRth),imag(PavgRth));
[t7,r7] = cart2pol(real(ratio),imag(ratio));

% build answer matrix                
answerTable=[[r0;rad2deg(t0)]',[r1;rad2deg(t1)]',[r2;rad2deg(t2)]',...
            [r3;rad2deg(t3)]',[r4;rad2deg(t4)]',[r5;rad2deg(t5)]',...
            [r6;rad2deg(t6)]',[r7;rad2deg(t7)]'
];

%output table
fprintf('\n\nRequested values (in polar form) as a function of load resistance Rl\n');
fprintf('|%16s|%16s|%16s|%16s|%16s|%16s|%16s|%16s|\n',...
        'Rl(Ohms)','Irms(A)','Vrms(V)','P_avg(W)',...
        'S(P_app(VA)=|S|)','PF','P_Rth(W)','P_Rth/P_avg');
fprintf('|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|%8.4f/%7.2f|\n',...
        answerTable');
