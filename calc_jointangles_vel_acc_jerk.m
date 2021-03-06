%% Angular velocity and acceleration of joint angles

function [ja_vel, ja_acc,ja_jerk]=calc_jointangles_vel_acc_jerk(joint_angles,newref_filt_shoulder,time)

for i=1:length(newref_filt_shoulder(:,1))-1
    ja_vel(i,:)=(pi/180)*(joint_angles(i+1,:)-joint_angles(i,:))/(time(i+1)-time(i));
end

for i=1:length(newref_filt_shoulder(:,1))-2
    ja_acc(i,:)=(pi/180)*(ja_vel(i+1,:)-ja_vel(i,:))/(time(i+1)-time(i));
end

for i=1:length(newref_filt_shoulder(:,1))-3
    ja_jerk(i,:)=(pi/180)*(ja_acc(i+1,:)-ja_acc(i,:))/(time(i+1)-time(i));
end
