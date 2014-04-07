%% ANN error with different number of Hidden Nodes
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
M = 5; % M is No. of hidden layer nodes
Kfold = 5; % Folder number of K-fold cross-validation
max_iter = 100000; % Maximum iteration for training
eta = 0.2; % Learning rate
mom = 0.9;  % Momemtum for learning
W1=ones(D+1,M);
W2=ones(M+1,K);

%% Cross-validation: Split data into train set and test set
idx=crossvalind('Kfold',size(x,1),5);
test_idx = find(idx==1);
train_idx = find(idx~=1);
train_x=x(train_idx,:);
train_t=t(train_idx,:);
test_x=x(test_idx,:);
test_t=t(test_idx,:);

%% Learn parameters by Back-propagation
prev_delt_W1 = zeros(D+1,M);
prev_delt_W2=zeros(M+1,K);
for iter=1:max_iter
    
    %% Training
    % Stochastic gradient descent
    % Enable using data more than once, idx_crt is current index of the point
    idx_crt = rem(iter-1,size(train_x,1))+1;
    layer1 = [train_x(idx_crt,:) 1]';
    layer2 = [tanh(W1'*layer1)' 1]';
    t_hat = (W2'*layer2)';
    train_err(iter) = (t_hat - train_t(idx_crt))^2;
    % Back propagate
    delta = t_hat - train_t(idx_crt,:);
    delta2 = (1-tanh(W1'*layer1).^2).*(W2(1:M,:)*delta');
    %Update W
    delt_W1 = eta*(mom*prev_delt_W1+(1-mom)*(repmat(delta2,1,D+1).*repmat(layer1',M,1))');
    delt_W2 = eta*(mom*prev_delt_W2+(1-mom)*(repmat(delta,1,M+1).*repmat(layer2',K,1))');
    W1 = W1 - delt_W1;
    W2 = W2 - delt_W2;
    prev_delt_W1 =  delt_W1;
    prev_delt_W2 = delt_W2;
    
end
% Mean Square Error with iteration on Training set
figure(1)
plot(1:iter,train_err,'rp-');
grid on;
xlabel('iteration');
ylabel('Mean Square Error');
title('Mean Square Error with iteration');

%% Testing
% Using test data
test_layer1 = [test_x ones(size(test_x,1),1)];
test_layer2 = [tanh((W1'*test_layer1')./2)' ones(size(test_x,1),1)]; %z=tanh(a);
test_t_hat = (W2'*test_layer2')';
test_err_mean = mean(test_t_hat - test_t);
test_err_std = std(test_t_hat - test_t);
fprintf('\nMean error on test set: ');
test_err_mean
fprintf('\nStandard deviation of prediction of test set:\n');
test_err_std

figure(2);
plot(1:size(test_x,1),test_t_hat,'rp-',1:size(test_x,1),test_t,'bs-');
legend('Predicted value', 'True target value');
grid on;
xlabel('Data Sample');
ylabel('Value');
title('Compare of predicted and true value on test set');






