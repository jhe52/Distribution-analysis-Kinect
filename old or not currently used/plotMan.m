%% Draw reference man figure

function plotMan(right_shoulder_filt)

if ~exist('right_shoulder_filt');  right_shoulder_filt=[0.68 0.825 0.6];  end 
% right_shoulder_L=mean(right_shoulder(:,1));   %1.05
% left_shoulder_L=right_shoulder_L-0.2;   %0.75
% right_shoulder_R=right_shoulder_L+0.07; %1.12
% left_shoulder_R=left_shoulder_L-0.7;    %0.68
% 
% shoulder_U=mean(right_shoulder(:,2));   %0.65
% shoulder_B=shoulder_U-0.05;             %0.60
% shoulder_I=mean(right_shoulder(:,3));   %0.6
% shoulder_O=shoulder_I-0.5;              %0.1
% 
% xCalc = [left_shoulder_L left_shoulder_L right_shoulder_L right_shoulder_L right_shoulder_R right_shoulder_R left_shoulder_R left_shoulder_R];      % trapezoid x dimensions (bottom then top)
% yCalc = [shoulder_B shoulder_U shoulder_U shoulder_B shoulder_B shoulder_U shoulder_U shoulder_B];          % trapezoid y dimensions
% zCalc = [shoulder_O shoulder_O shoulder_O shoulder_O shoulder_I shoulder_I shoulder_I shoulder_I];              % trapezoid z dimensions


xCalc = [0.75 0.75 1.05 1.05 1.12 1.12 0.68 0.68];      % trapezoid x dimensions (bottom then top)
yCalc = [0.6 0.65 0.65 0.6 0.6 0.65 0.65 0.6];          % trapezoid y dimensions
zCalc = [0.1 0.1 0.1 0.1 0.6 0.6 0.6 0.6];              % trapezoid z dimensions

%bottom
fill3(xCalc([1 2 3 4]), yCalc([1 2 3 4]), zCalc([1 2 3 4]),1,'FaceAlpha',0.1); hold on
%up
fill3(xCalc([5 6 7 8]), yCalc([5 6 7 8]), zCalc([5 6 7 8]),1, 'FaceAlpha',0.1); hold on
%right
fill3(xCalc([3 4 5 6]), yCalc([3 4 5 6]), zCalc([3 4 5 6]),1, 'FaceAlpha',0.1); hold on
%left
fill3(xCalc([1 2 7 8]), yCalc([1 2 7 8]), zCalc([1 2 7 8]),1, 'FaceAlpha',0.1); hold on
%back
fill3(xCalc([1 4 5 8]), yCalc([1 4 5 8]), zCalc([1 4 5 8]),1, 'FaceAlpha',0.1); hold on
%front
fill3(xCalc([2 3 6 7]), yCalc([2 3 6 7]), zCalc([2 3 6 7]),1,'FaceAlpha',0.1); hold on

% head  
head=[0.9,0.625,0.75]; 
headRadii=[.09 .09 .11];
ellipsoid(head(1),head(2),head(3), headRadii(1),headRadii(2),headRadii(3)); 

% right arm
shoulderR=[0.68 0.625 0.6]; 
elbowR=[0.65 0.625 0.3];
upperarmR=vertcat(shoulderR,elbowR);
fill3(upperarmR(:,1),upperarmR(:,2),upperarmR(:,3),'-','Linewidth',6)
wristR=[0.6 0.625 0.16];
rightArm=vertcat(elbowR,wristR);
fill3(rightArm(:,1),rightArm(:,2),rightArm(:,3),'-','Linewidth',6)

% left arm
shoulderL=[1.12 0.625 0.6]; 
elbowL=[1.15 0.625 0.3];
upperarmL=vertcat(shoulderL,elbowL);
fill3(upperarmL(:,1),upperarmL(:,2),upperarmL(:,3),'-','Linewidth',6)
handL=[1.2 0.625 0.16];
leftArm=vertcat(elbowL,handL);
fill3(leftArm(:,1),leftArm(:,2),leftArm(:,3),'-','Linewidth',6)

% right leg
hipR=[0.77 0.625 0.1]; 
ankleR=[0.75 0.625 -0.5];
rightLeg=vertcat(hipR,ankleR);
fill3(rightLeg(:,1),rightLeg(:,2),rightLeg(:,3),'-','Linewidth',8)

% left leg
hipL=[1.02 0.625 0.1]; 
ankleL=[1.05 0.625 -0.5];
leftLeg=vertcat(hipL,ankleL);
fill3(leftLeg(:,1),leftLeg(:,2),leftLeg(:,3),'-','Linewidth',8)

axis equal
grid on
