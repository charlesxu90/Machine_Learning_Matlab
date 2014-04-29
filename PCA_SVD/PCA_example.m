%% PCA
close all; clear all; clc;
% Generate data
Data = mvnrnd([5, 5],[1 1.5; 1.5 3], 100);
% Center the data
m=mean(Data);
for i = 1:size(Data,1)
Data(i, :) = Data(i, :) - m; 
end
t=ceil(max(abs(Data(:))));
figure(1); 
plot(Data(:,1), Data(:,2), '+');
axis([-t t -t t])

% Covariance matrix
DataCov = Data'*Data/(size(Data,1)-1); 

% PC: eigenvector; variances: eigenvalue 
% Explained: percentage of the total variance explained by each principal 
% component = variances/sum(variances)
[PC, variances, eigenvalues] = pcacov(DataCov); 

%% Plot principal components
figure; 
plot(Data(:,1), Data(:,2), '+b');
axis([-t t -t t])
hold on

plot(PC(1,1)*[-t t], PC(2,1)*[-t t], '-r') 
plot(PC(1,2)*[-t t]/2, PC(2,2)*[-t t]/2, '-b'); 
hold off
% axis equal 
axis([-t t -t t])

%% Project down to 1 dimension
PcaPos = Data * PC(:, 1);

figure; 
plot(PcaPos, '+b');

PcaPos2 = Data * PC(:, 2);

figure; 
plot(PcaPos2, '+r');