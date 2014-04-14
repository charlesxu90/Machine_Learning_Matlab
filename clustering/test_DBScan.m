%% Pretest for DBScan algorithm
clear all;
close all;
clc;
% Load data
data = importdata('clu_data.txt');
n = size(data,1);
k=10; % No. of nearest neighbors
norm =1; % Whether to normalize or not, 1:norm
if norm==1
    data=(data-repmat(mean(data),n,1))./repmat(std(data),n,1);
end

% Calculate the distance matrix
prox_mat=nan(n);
% Initiate proximity matrix
for i=1:n
    for j=i:n
        prox_mat(i,j) = sum((data(i,:)-data(j,:)).^2);
        prox_mat(j,i) = prox_mat(i,j);
        
    end
end

% dist1=zeros((n-1)*(n-2)/2,1);
% for i=2:n
%     if(i==2)
%         dist1(1,1)=prox_mat(i,i-1);
%     else
%         dist1(((i-2)*(i-1)/2+1):(i-1)*i/2,1)=prox_mat(i,1:i-1);
%     end
% end
% Sdist1=sort(dist1);
% plot(Sdist1)

dist5=zeros(n,1);
for i=1:n
    dSorted=sort(prox_mat(i,:));
    dist5(i)=dSorted(k);
end
Sdist5=sort(dist5);
plot(Sdist5)