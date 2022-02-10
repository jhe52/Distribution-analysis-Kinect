%% Load csv file manually

clear all
close all
clc

exercise_sub1 = readtable('/Users/jialinhe1/Desktop/Tesi/Kinect/Codes/data/FE_ele2', 'NumHeaderLines',1);

%% Change reference system, filter and get time reference in seconds

% rotation of 90º around X axis 
theta1=1.5708;
% rotation1 of 180º around Z axis 
theta2=3.14159;         % since the kinect see in opposite way
% filter: zero-lag-4th-order Butterworth low pass filter with cut off 6Hz
fc=6;           % cut off frequency
fs=1/(33*0.001);      % sample frequency (∂t≈33ms)
[b,a] = butter(4,fc/(fs/2), 'low');     % 4th order

[exercise_sub1_wrist,exercise_sub1_elbow,exercise_sub1_shoulder,exercise_sub1_hip,exercise_sub1_spine,right_wrist,right_wrist_filt,right_elbow,right_elbow_filt,right_shoulder,right_shoulder_filt,L,time]=newref_and_filter(exercise_sub1,b,a,theta1,theta2);

%% Plot activity wrist motion in 3D after filtering
figure
plotMan(right_shoulder_filt); 
hold on
% plot3(exercise_sub1_wrist(:,1), exercise_sub1_wrist(:,2),exercise_sub1_wrist(:,3),'MarkerEdgeColor','k','MarkerFaceColor','b'); 
scatter3(exercise_sub1_wrist(:,1), exercise_sub1_wrist(:,2),exercise_sub1_wrist(:,3),'MarkerEdgeColor','k','MarkerFaceColor','b'); 
axis equal
xlabel('Motion in x [m]');
ylabel('Motion in y [m]');
zlabel('Motion in z [m]');
title('Raising - wrist motion in 3D space with respect to Kinect reference system')
hold off

%% Plot histograms

figure
nBins=10;
plotDust(exercise_sub1_wrist,nBins)   % plotDust(x,nBins)
                                      % X = rows of multidimensional values, cols are dimension
                                      % nBins = # equally-spaced bins, for counting
axis equal
xlabel('Motion in x [m]');
ylabel('Motion in y [m]');
zlabel('Motion in z [m]');
title('Wrist movement distribution histogram')

%% Calculate elbow-shoulder, shoulder-spine, shoulder-hip, wrist-elbow segments and shoulder (A/A and F/E) elbow (F/E) angles

joint_angles=calc_jointangles(exercise_sub1_wrist,exercise_sub1_elbow,exercise_sub1_shoulder,exercise_sub1_hip,exercise_sub1_spine);

figure
plot(time,joint_angles)
hold on

xlabel('Time[s]');
ylabel('Joint angles [degree]');
title('Raising - shoulder and elbow angles in time ')
legend('Shoulder abduction/adduction','Shoulder horizontal flexion/extension','Elbow flexion/extension')
hold off

%% Plot histograms of joint angles

figure
nBins=10;
plotDust(joint_angles,nBins)   % plotDust(x,nBins)
                               % X = rows of multidimensional values, cols are dimension
                               % nBins = # equally-spaced bins, for counting
axis equal
xlabel('Shoulder abduction [deg]')
ylabel('Shoulder flexion [deg]')
zlabel('Elbow flexion [deg]')
title('Shoulder and elbow joint angles distribution histogram - free expl')


%% Plot histograms of angular velocity and acceleration

[ja_vel, ja_acc]=joint_angle_vel_acc(joint_angles,exercise_sub1_shoulder,time);

figure
nBins=10;
plotDust(ja_vel,nBins)   % plotDust(x,nBins)
                         % X = rows of multidimensional values, cols are dimension
                         % nBins = # equally-spaced bins, for counting
axis equal
xlabel('Shoulder abduction [deg/s]')
ylabel('Shoulder flexion [deg/s]')
zlabel('Elbow flexion [deg/s]')
title('Shoulder and elbow joint angles velocity distribution histogram')

figure
nBins=10;
plotDust(ja_acc,nBins)   % plotDust(x,nBins)
                         % X = rows of multidimensional values, cols are dimension
                         % nBins = # equally-spaced bins, for counting
axis equal
xlabel('Shoulder abduction [deg/s^2]')
ylabel('Shoulder flexion [deg/s^2]')
zlabel('Elbow flexion [deg/s^2]')
title('Shoulder and elbow joint angles acceleration distribution histogram')

