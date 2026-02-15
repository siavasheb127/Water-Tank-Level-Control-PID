clear; clc; close all;

A = 100;
a = 15.86;
h0 = 10;
lambda = a / (2 * A * sqrt(h0));

G1 = tf(0.01, [1 0]);
G2 = tf(0.01, [1 lambda]);

t = 0:0.1:300;

figure;
step(G1, 'r--', G2, 'b', t);
grid on;
legend('Model 1', 'Model 2');
title('Step Response');

figure;
impulse(G1, 'r--', G2, 'b', t);
grid on;
legend('Model 1', 'Model 2');
title('Impulse Response');

u_ramp = t;
y1 = lsim(G1, u_ramp, t);
y2 = lsim(G2, u_ramp, t);

figure;
plot(t, u_ramp, 'k:', t, y1, 'r--', t, y2, 'b');
grid on;
legend('Ramp Input', 'Model 1', 'Model 2');
title('Ramp Response');

figure;
subplot(1,2,1); pzmap(G1); title('Poles/Zeros Model 1');
subplot(1,2,2); pzmap(G2); title('Poles/Zeros Model 2');


