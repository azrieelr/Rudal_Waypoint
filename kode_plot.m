%% Plot Posisi
pos1 = pos_ideal;
x = pos1(:,2);
y = pos1(:,3);
z = pos1(:,4);
figure
plot3(x,-y,-z);
set(gca,'FontSize',12);
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
% axis([0 100 -0.5 0.5 0 1])
grid on; hold on
plot3(p0(1),-p0(2),-p0(3),'ko','MarkerSize',10);
plot3(px,-py,-pz,'r-x','MarkerSize',10);


%% Plot Attitude
att1 = att_ideal;
t = att1(:,1);
a = att1(:,2);
b = att1(:,3);
c = att1(:,4);
figure
plot(t,b); title('Sudut Pitch','FontWeight','normal');
% plot(t,c); title('Sudut Yaw','FontWeight','normal');
% plot(t,a); title('Sudut Roll','FontWeight','normal');
set(gca,'FontSize',12);

xlabel('time (sec.)');
ylabel('rad');
% legend({'roll','pitch','yaw'},'FontSize',12);
grid on;

%% Plot Fin
t = fin(:,1);
a = fin(:,2);
b = fin(:,3);
c = fin(:,4);
figure
% plot(t,a,t,b,t,c);
plot(t,a,t,b,t,c);
set(gca,'FontSize',12);
% title('Fx Aerodynamic','FontWeight','normal');
xlabel('time (sec.)');
ylabel('\delta (rad)');
legend({'\deltaa','\deltae','\deltar'},'FontSize',12);
grid on;

%% Plot Kecepatan
t = V(:,1);
a = V(:,2);
figure
plot(t,a);
set(gca,'FontSize',12);
xlabel('time (sec.)');
ylabel('V (m/s)');
grid on;

%% Plot Attref
t = attref(:,1);
a = attref(:,2);
b = attref(:,3);
c = attref(:,4);
figure
plot(t,a,t,b,t,c);
% plot(t,a);
set(gca,'FontSize',12);
xlabel('\it time (sec.)');
ylabel('\it Att ref');
legend({'\phi','\theta','\psi'},'FontSize',12);
grid on;

%% Plot Aref
t = aref(:,1);
a = aref(:,2);
b = aref(:,3);
c = aref(:,4);
figure
plot(t,a,t,b,t,c);
% plot(t,a);
set(gca,'FontSize',12);
xlabel('\it time (sec.)');
ylabel('\it A ref');
legend({'Ax','Ay','Az'},'FontSize',12);
grid on;

%% Plot Alpha Beta
ab = angle;
t = ab(:,1);
a = ab(:,2);
b = ab(:,3);
figure
plot(t,a,t,b);
% plot(t,c);
set(gca,'FontSize',12);
xlabel('time (sec.)');
ylabel('rad');
legend({'\alpha','\beta'},'FontSize',12);
title('Sudut \alpha \beta','FontWeight','normal');
grid on;


%% Plot Perbadingan Posisi

pos2 = pos_ideal;
att2 = att_ideal;
x2 = pos2(:,2);
y2 = pos2(:,3);
z2 = pos2(:,4);
plot3(x,y,-z,x2,y2,-z2);
set(gca,'FontSize',12);
legend({'Enviro Dinamik','Enviro Statik'},'location','northeast','FontSize',12);
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
% axis([0 4000 0 500 0 80])
grid on;

%% Roll
t = D1(:,1);
plot(t,D1(:,2),t,D2(:,2));
set(gca,'FontSize',12);
xlabel('Waktu (det)');
ylabel('\DeltaD');
legend({'\DeltaD1 = SP1-SP3','\DeltaD2 = SP0-SP2'},'FontSize',12);
axis([0 8 0 0.15]);

%% Jalankan mode = 2 (PN seeker 4 kuadran)
% az = -N*Vm*dy-g(3);
% ay = N*Vm*dx;

pos3 = pos_ideal;
att3 = att_ideal;
x3 = pos3(:,2);
y3 = pos3(:,3);
z3 = pos3(:,4);
plot3(x,y,-z,x2,y2,-z2,x3,y3,-z3);
set(gca,'FontSize',12);
% legend('Ideal','Nvx','Nvdx','location','northeast');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
grid on;

%% Jalankan mode = 2 (PN seeker 4 kuadran)
% az = -N*Vm*(-y) - g(3);
% ay = N*Vm*x;

% pos4 = pos_ideal;
% att4 = att_ideal;
% x4 = pos4(:,2);
% y4 = pos4(:,3);
% z4 = pos4(:,4);
plot3(x,y,-z,x2,y2,-z2,x3,y3,-z3,x4,y4,-z4);
set(gca,'FontSize',12);
legend('Ideal','NVx','NVdx','NVx v2','location','northeast');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
grid on;

%% Jalankan mode = 2 (PN seeker 4 kuadran)
% az = -N*Vm*(-dy) - g(3);
% ay = N*Vm*dx;

% pos5 = pos_ideal;
% att5 = att_ideal;
% x5 = pos5(:,2);
% y5 = pos5(:,3);
% z5 = pos5(:,4);
plot3(x,y,-z,x2,y2,-z2,x3,y3,-z3,x4,y4,-z4,x5,y5,-z5);
set(gca,'FontSize',12);
legend('Ideal','NVx','NVdx','NVx v2','NVdx v2','location','northeast');
xlabel('X (m)');
ylabel('Y (m)');
zlabel('Z (m)');
grid on;