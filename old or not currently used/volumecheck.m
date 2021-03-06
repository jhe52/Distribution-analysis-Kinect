%% CONFRONT 2 PLOTS

%% CDF

nBins=4;
counts1=plotDust(exercise_sub1_wrist,nBins)

nBins=4;
counts2=plotDust(exercise_sub2_wrist,nBins)

cdf1 = cumsum(counts1); % Sum histogram counts to get cumulative distribution function.
cdf1 = cdf1 / cdf1(end); % Normalize.
% Get data value where 80% is.
data1GT90_ = find(cdf1>= 0.9, 1, 'first')

cdf2 = cumsum(counts2); 
cdf2 = cdf2 / cdf2(end); 
data2GT90 = find(cdf2>= 0.8, 1, 'first')

%% CONTROL - calc max points
% 
% figure
% scatter3(exercise_sub1_wrist(:,1),exercise_sub1_wrist(:,2), exercise_sub1_wrist(:,3),1,'MarkerEdgeColor','k','MarkerFaceColor','b'); 
% hold on
% axis equal
% grid on
% xlabel('Horizontal plane [m]');
% ylabel('Sagittal plane [m]');
% zlabel('Frontal plane [m]');
% title('Free exploration - wrist motion in 3D space')
% 
% x=exercise_sub1_wrist(:,1);
% y=exercise_sub1_wrist(:,2);
% z=exercise_sub1_wrist(:,3);
% [A,V]=convhull(x,y,z);
% trimesh(A,x,y,z);
% hold off

%% 2D

% x=exercise_sub1_wrist(:,2);
% y=exercise_sub1_wrist(:,3);
% k=boundary(x,y)
% plot(x(k),y(k))
% hold off
% 
% p_ctrl = prctile(x,90)
% area_ctrl=polyarea(x(k),y(k))   
% trapz_ctrl=trapz(y(k),x(k))                 % same result as polyarea


%% CONTROL: mean and standard deviation + %% remove outliers

%figure
center_point_ctrl=mean(exercise_sub1_wrist);
median_ctrl=median(exercise_sub1_wrist);
std_ctrl=std(exercise_sub1_wrist);
%boxplot(exercise_sub1_wrist,'notch','on')

x=exercise_sub1_wrist(:,1);
y=exercise_sub1_wrist(:,2);
z=exercise_sub1_wrist(:,3);

distance_x=[];
distance_y=[];
distance_z=[];

inside_std_x=[];
inside_std_y=[];
inside_std_z=[];

for i=1:size(exercise_sub1_wrist)
    distance_x(i,1)=exercise_sub1_wrist(i,1)-median_ctrl(1,1); % AGGIUSTARE! RENDERLI CONIL LORO SEGNO E NON NORMA
    distance_y(i,1)=exercise_sub1_wrist(i,2)-median_ctrl(1,2);
    distance_z(i,1)=exercise_sub1_wrist(i,3)-median_ctrl(1,3);
%     datax=horzcat(exercise_sub1_wrist(i,1),distance_x(i,1));
%     datay=horzcat(exercise_sub1_wrist(i,2),distance_x(i,2));
%     datax=horzcat(exercise_sub1_wrist(i,3),distance_x(i,3));
%     if (abs(distance_x)<std_ctrl(1,1)) && ( ...
%             abs(distance_y)<std_ctrl(1,2)) && ( ...
%             abs(distance_z)<std_ctrl(1,3))
%         inside_std_x=vertcat(inside_std_x,exercise_sub1_wrist(i,1));
%         inside_std_y=vertcat(inside_std_y,exercise_sub1_wrist(i,2));
%         inside_std_z=vertcat(inside_std_z,exercise_sub1_wrist(i,3));
    %     end
end

maxcutoffx=prctile(distance_x,90);
maxcutoffy=prctile(distance_y,90);
maxcutoffz=prctile(distance_z,90);
mincutoffx=prctile(distance_x,10);
mincutoffy=prctile(distance_y,10);
mincutoffz=prctile(distance_z,10);

for i=1:size(distance_x)
    if (abs(distance_x(i))<maxcutoffx) && (abs(distance_y(i))<maxcutoffy) && ( ...
            abs(distance_z(i))<maxcutoffz) && (abs(distance_x(i))>mincutoffx) && ( ...
            abs(distance_y(i))>mincutoffy) && ( ...
            abs(distance_z(i))>mincutoffz)
        inside_std_x=vertcat(inside_std_x,distance_x(i));
        inside_std_y=vertcat(inside_std_y,distance_y(i));
        inside_std_z=vertcat(inside_std_z,distance_z(i));
    end
end

inside_std=horzcat(inside_std_x,inside_std_y,inside_std_z);
remainingpoints=inside_std+median_ctrl;

figure
scatter3(exercise_sub1_wrist(:,1),exercise_sub1_wrist(:,2), exercise_sub1_wrist(:,3),1,'MarkerEdgeColor','k','MarkerFaceColor','b'); 
hold on
scatter3(median_ctrl(:,1),median_ctrl(:,2),median_ctrl(:,3),5,'MarkerFaceColor','r');
hold on
axis equal
grid on
xlabel('Horizontal plane [m]');
ylabel('Sagittal plane [m]');
zlabel('Frontal plane [m]');
title('CTRL - 90th percentile of wrist motion')

[Actrl,Vctrl]=convhull(inside_std_x,inside_std_y,inside_std_z);
trimesh(Actrl,remainingpoints(:,1),remainingpoints(:,2),remainingpoints(:,3));
fprintf('\n Volume of ROM in CTRL is %d', Vctrl);

clear distance_x; clear distance_y; clear distance_z; clear inside_x; clear inside_y; clear inside_z; 
clear maxcutoffx; clear maxcutoffy; clear maxcutoffz; clear mincutoffx; clear mincutoffy; clear mincutoffz;

%% EXO: mean and standard deviation + %% remove outliers

%figure
center_point_exo=mean(exercise_sub2_wrist);
median_exo=median(exercise_sub2_wrist);
std_exo=std(exercise_sub2_wrist);
%boxplot(exercise_sub1_wrist,'notch','on')

distance_x=[];
distance_y=[];
distance_z=[];

inside_x=[];
inside_y=[];
inside_z=[];

for i=1:size(exercise_sub2_wrist)
    distance_x(i,1)=exercise_sub2_wrist(i,1)-median_ctrl(1,1); 
    distance_y(i,1)=exercise_sub2_wrist(i,2)-median_ctrl(1,2);
    distance_z(i,1)=exercise_sub2_wrist(i,3)-median_ctrl(1,3);
end

maxcutoffx=prctile(distance_x,90);
maxcutoffy=prctile(distance_y,90);
maxcutoffz=prctile(distance_z,90);
mincutoffx=prctile(distance_x,10);
mincutoffy=prctile(distance_y,10);
mincutoffz=prctile(distance_z,10);

for i=1:size(distance_x)
    if (abs(distance_x(i))<maxcutoffx) && (abs(distance_y(i))<maxcutoffy) && ( ...
            abs(distance_z(i))<maxcutoffz) && (abs(distance_x(i))>mincutoffx) && ( ...
            abs(distance_y(i))>mincutoffy) && ( ...
            abs(distance_z(i))>mincutoffz)
        inside_x=vertcat(inside_x,distance_x(i));
        inside_y=vertcat(inside_y,distance_y(i));
        inside_z=vertcat(inside_z,distance_z(i));
    end
end

inside_std=horzcat(inside_x,inside_y,inside_z);
remainingpoints=inside_std+median_ctrl;

figure
scatter3(exercise_sub2_wrist(:,1),exercise_sub2_wrist(:,2), exercise_sub2_wrist(:,3),1,'MarkerEdgeColor','k','MarkerFaceColor','b'); 
hold on
scatter3(median_ctrl(:,1),median_ctrl(:,2),median_ctrl(:,3),5,'MarkerFaceColor','r');
hold on
axis equal
grid on
xlabel('Horizontal plane [m]');
ylabel('Sagittal plane [m]');
zlabel('Frontal plane [m]');
title('Exo - 90th percentile of wrist motion')

[Aexo,Vexo]=convhull(inside_x,inside_y,inside_z);
trimesh(Aexo,remainingpoints(:,1),remainingpoints(:,2),remainingpoints(:,3));
fprintf('\n Volume of ROM in EXO is %d', Vexo);

clear distance_x; clear distance_y; clear distance_z; clear inside_x; clear inside_y; clear inside_z; 
clear maxcutoffx; clear maxcutoffy; clear maxcutoffz; clear mincutoffx; clear mincutoffy; clear mincutoffz;

