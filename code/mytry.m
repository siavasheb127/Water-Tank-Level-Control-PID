A = 100;
c = 0.6*sqrt(2*9.81);

kp = 0.5;
ki = 0.2;
kd = 0.0001;

u_raw = out.u_data;
y_raw = out.y_data;

u = u_raw.Data;
y = y_raw.Data;
t = y_raw.Time;

Ts = mean(diff(t));

data = iddata(y, u, Ts);
data = detrend(data);

sys_est = tfest(data, 1, 0);
sys_est

[num, den] = tfdata(sys_est, 'v');
G = tf(num, den);

figure;
bode(G);
grid on;

figure;
nyquist(G);
grid on;

figure;
pzmap(G);
grid on;

C = pid(kp, ki, kd);

T = feedback(C*G, 1);

figure;
step(T);
grid on;
