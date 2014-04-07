%% ANN error with different initialization of weights
%% Artificial Neuro Network
% back propagation using stochastic; 
close all;
clear;
clc;

%% Generation of Data
x1 = [0.001:0.001:2.000]';
x2 = [0.0004:0.0004:.80000]';
noise = 0.1.*randn(1,2000)';
x=[x1 x2];
t= x1+x2.^2+(2*x1-cos(x2)).^2+noise;% Target value


%% Neuro Network Parameters
D = 2; % No. of input nodes
K = 1; % No. of output nodes
M = 5; % No. of hidden layer nodes
Kfold = 5; % Folder number of K-fold cross-validation
max_iter = 5000; % Maximum iteration for training
eta = 0.2; % Learning rate
no_ini = 1; % No. of different initialization

for w=0:0.1:1
    W1=ones(D+1,M)*w;
    W2=ones(M+1,K)*w;
    %% Cross-validation: Split data into train set and test set
    idx=crossvalind('Kfold',size(x,1),5);
    test_idx = find(idx==1);
    train_idx = find(idx~=1);
    train_x=x(train_idx,:);
    train_t=t(train_idx,:);
    test_x=x(test_idx,:);
    test_t=t(test_idx,:);
    
    %% Learn parameters by Back-propagation
    for iter=1:max_iter
        
        %% Training
        % Stochastic gradient descent
        % Enable using data more than once, idx_crt is current index of the point
        idx_crt = rem(iter-1,size(train_x,1))+1;
        layer1 = [train_x(idx_crt,:) 1]';
        layer2 = [tanh(W1'*layer1)' 1]';
        t_hat = (W2'*layer2)';
        % Back propagate
        delta = t_hat - train_t(idx_crt,:);
        delta2 = (1-tanh(W1'*layer1).^2).*(W2(1:M,:)*delta');
        %Update W
        W1 = W1 - eta*(repmat(delta2,1,D+1).*repmat(layer1',M,1))';
        W2 = W2 - eta*(repmat(delta,1,M+1).*repmat(layer2',K,1))';
        
    end
    %% Testing
    train_layer1 = [train_x ones(size(train_x,1),1)];
    train_layer2 = [tanh((W1'*train_layer1')./2)' ones(size(train_x,1),1)]; %z=tanh(a);
    train_t_err(no_ini,:) = (W2'*train_layer2'-train_t');

    
    test_layer1 = [test_x ones(size(test_x,1),1)];
    test_layer2 = [tanh((W1'*test_layer1')./2)' ones(size(test_x,1),1)]; %z=tanh(a);
    test_t_err(no_ini,:) = (W2'*test_layer2'-test_t');
    no_ini = no_ini +1;
end
train_err_mean = mean(train_t_err,2);
train_err_std = std(train_t_err',1);
test_err_mean = mean(test_t_err,2);
test_err_std = std(test_t_err',1);
figure(1)
errorbar(0:0.1:1,train_err_mean,train_err_std,'rp-')
hold on
errorbar(0:0.1:1,test_err_mean,test_err_std,'bs-')

legend('Train error', 'Test error');
grid on;
xlabel('Different initial weight');
ylabel('Error');
title('Compare of error on test and train data');


