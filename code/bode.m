clear; clc; close all;

G1 = tf(0.01, [1 0]);
G2 = tf(0.01, [1 0.025]);

figure;
bode(G1, 'r--', G2, 'b');
grid on;
legend('Model 1', 'Model 2');
title('Bode Diagram');

margin(G2);

figure;
nyquist(G1, 'r--', G2, 'b');
grid on;
legend('Model 1', 'Model 2');
title('Nyquist Diagram');
axis([-0.5 0.5 -1 1]);