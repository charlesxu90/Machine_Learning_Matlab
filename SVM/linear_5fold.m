%% SVM with 5-Fold cross validation train params
% Use 5 fold cross-validation to choose the right parameter
% For linear kernel
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
linear_AUC1=zeros(miter,1); % Area Under ROC

% Try -c with different values
% also tried -e,-g with different values
for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
    linear_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 0  -c 1'); 
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), linear_SVM1);    
    [X,Y,T,linear_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
linear_AUC2(1,1)=mean(linear_AUC1);
linear_AUC2(1,2)=std(linear_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
    linear_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 0 -c 10');
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), linear_SVM1);    
    [X,Y,T,linear_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
linear_AUC2(2,1)=mean(linear_AUC1);
linear_AUC2(2,2)=std(linear_AUC1);

for iter=1:miter
    test_idx = find(idx==mod(iter,5)+1);
    train_idx = find(idx~=mod(iter,5)+1);
    %% Train linear classifier
    % Train the SVM
    linear_SVM1 = svmtrain(t(train_idx,:),x(train_idx,:), '-t 0  -c 30');
    % Make a prediction for the test set
    [t_hat1, accuracy, t_values] = svmpredict(t(test_idx,:),x(test_idx,:), linear_SVM1);    
    [X,Y,T,linear_AUC1(iter),Poc]=perfcurve(t(test_idx,:),t_values,1);
end
linear_AUC2(3,1)=mean(linear_AUC1);
linear_AUC2(3,2)=std(linear_AUC1);
linear_AUC2