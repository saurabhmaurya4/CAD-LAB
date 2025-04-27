% Plot a triangle with vertices
% (0,0); (3,0); (0, 4)
clc; clear; close all;
%x = [0 3 0 0];
%y = [0 0 4 0];
clc; clear; close all;
% Homogenized co-ordinate system
original = [0 3 0 0;
            0 0 4 0;
            1 1 1 1];
figure;
%subplot(1,3,1);
plot(original(1,:),original(2,:),'k-','LineWidth',2);
hold on;
% Translation
tx = 1; ty = 1;
T = [1 0 tx;
     0 1 ty;
     0 0 1];
translated = T * original;
%subplot(1,3,2);
plot(translated(1,:),translated(2,:),'b-','LineWidth',2);
hold on;
% Scaling
sx = 0.5; sy = 0.5;
S = [sx 0 0;
     0 sy 0;
     0 0 1];
scaled = S * original;
%subplot(1,3,3);
plot(scaled(1,:),scaled(2,:),'g-','LineWidth',2);
axis equal; grid on; 
hold on;
% Rotation 
theta = 30;
c = cosd(theta);
s = sind(theta);
R = [ c -s 0;
      s c 0;
      0 0 1];
rotated = R * original;
plot(rotated(1,:),rotated(2,:),'cyan-','LineWidth',2);
axis equal; grid on; 
hold on;