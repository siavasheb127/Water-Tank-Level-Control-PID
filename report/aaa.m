clc; clear
s = tf('s');
Ka = 0.05;
J = 1; 
f = 0.2;
Km = 0.8;
Ra = 2;
Kb = 0.5;
Kt = 1;
G = 1/(J*s + f);  
Gg = 1/s;         
Gop = Ka * Gg * feedback((Km/Ra) * G, Kb);
Gcl = feedback(Gop, Kt);

[A, B, C, D] = linmod('dsds');
sys_linmod = ss(A, B, C, D);
display(tf(sys_linmod));

