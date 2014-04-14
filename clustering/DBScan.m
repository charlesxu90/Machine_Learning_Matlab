%% DBScan algorithm
clear all;
close all;
clc;
% Load data
data = importdata('clu_data.txt');
n = size(data,1);
norm =1; % Whether to normalize or not
if norm==1
    data=(data-repmat(mean(data),n,1))./repmat(std(data),n,1);
end
%% Set initial params
if norm == 1
    eps=.1;
    minPts = 10;
else
    eps=80;
    minPts = 5;
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

%% DBScan algorithm
visited=zeros(n,1); % Wheter or not point is visited, 0:not,1:visited
mark=zeros(n,1); % Mark points; 0:not set, 1:core, 2:border, 3: noise
cluster=zeros(n,1);
c=0;
for i=1:n
    % Continue if i is already marked
    if visited(i)~=0
        continue;
    end
    
    visited(i)=1;
    neibor = find(prox_mat(i,:)<=eps); % Get index of neighbors
    
    if size(neibor,2)< minPts
        mark(i)=3; % Mark noise if not enough neighbors
    else
        c=c+1;
        mark(i)=1; % Mark core
        [cluster,visited,mark]=expandCluster(i,neibor,prox_mat,eps,minPts,c,cluster,visited,mark);
    end
end
c
figure(2)
plot(data(cluster==1,1),data(cluster==1,2),'r*');
hold on
plot(data(cluster==2,1),data(cluster==2,2),'bx');
plot(data(cluster==3,1),data(cluster==3,2),'g*');
plot(data(cluster==4,1),data(cluster==4,2),'rx');
plot(data(cluster==5,1),data(cluster==5,2),'ro');
plot(data(cluster==6,1),data(cluster==6,2),'go');
plot(data(cluster==7,1),data(cluster==7,2),'bx');
plot(data(cluster==8,1),data(cluster==8,2),'bo');
% hold off
% legend('1','2','3','4','5','6','7','8');
