%% SVM with 5-Fold cross validation train params
% Use 5 fold cross-validation to choose the right parameter
% For rbf kernel
clear all;
close all;
clc;

% addpath to the libsvm toolbox
addpath('./libsvm/matlab');

%% Read and transform data
% data=csvread('winequality-white.csv',1,0);
data=csvread('winequality-red.csv',1,0);
x0=data(:,1:11);
n=size(data,1);
x0=(x0-repmat(mean(x0),n,1))./repmat(std(x0),n,1);
t=data(:,12);
t(t<=5)=-ones(size(find(t<=5)));
t(t>5)=ones(size(find(t>5)));
x=x0;
% x=sparse(x0);
% libsvmwrite('white_wine',t,x);
% [t, x] = libsvmread('white_wine');

%% Parameters for training SVM
% Split into 5 sets
idx=crossvalind('Kfold',n,5);

%% cross-validation
miter=5;
% Initiatilize array
rbf_AUC1=zeros(miter,1); % Area Under ROC

% Try -c with different values
% also tried -e,-g with different values
for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2  -c 1'); 
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2  -c 10 -g 1'); 
    rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2  -c 10 -g 1/11 -d 2'); 
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), rbf_SVM1);    
    [X,Y,T,rbf_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
rbf_AUC2(1,1)=mean(rbf_AUC1);
rbf_AUC2(1,2)=std(rbf_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2  -c 5'); 
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 0.4');
    rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 1/11 -d 3');
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), rbf_SVM1);    
    [X,Y,T,rbf_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
rbf_AUC2(2,1)=mean(rbf_AUC1);
rbf_AUC2(2,2)=std(rbf_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10');
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 1/11'); 
    rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 1/11 -d 5'); 
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), rbf_SVM1);    
    [X,Y,T,rbf_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
rbf_AUC2(3,1)=mean(rbf_AUC1);
rbf_AUC2(3,2)=std(rbf_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 20');
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 0.01'); 
    rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 1/11 -d 10'); 
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), rbf_SVM1);    
    [X,Y,T,rbf_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
rbf_AUC2(4,1)=mean(rbf_AUC1);
rbf_AUC2(4,2)=std(rbf_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 30');
%     rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 0'); 
    rbf_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 2 -c 10 -g 1/11 -d 15'); 
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), rbf_SVM1);    
    [X,Y,T,rbf_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
rbf_AUC2(5,1)=mean(rbf_AUC1);
rbf_AUC2(5,2)=std(rbf_AUC1);

rbf_AUC2

