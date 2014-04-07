%% Artificial Neuro Network
% For Question 3 problem 1
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
method = 1; % 1: using stochastic; 2: using batch learning
if method == 1
    max_iter = 500000; % Maximum iteration for training
    eta = 0.2; % Learning rate
elseif method == 2
    max_iter = 5000; % Maximum iteration for training
    eta = 0.2; % Learning rate
end

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
for iter=1:max_iter
    
    %% Training
    if method == 1
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
        % Update W
        W1 = W1 - eta*(repmat(delta2,1,D+1).*repmat(layer1',M,1))';
        W2 = W2 - eta*(repmat(delta,1,M+1).*repmat(layer2',K,1))';
        
    elseif method == 2
        % Batch gradient descent
        layer1 = [train_x ones(size(train_x,1),1)]';
        layer2 = [tanh(W1'*layer1)' ones(size(train_x,1),1)]; %z=tanh(a);
        t_hat = (W2'*layer2')';
        train_err(iter) = sum((t_hat - train_t).^2)/size(train_x,1);
        % Back propagate
        delta = t_hat-train_t;
        delta2 = (1-tanh(W1'*layer1).^2).*(W2(1:M,:)*delta');
        % Update the parameters
        for d=1:D+1
            W1(d,:) = W1(d,:) - eta*1/size(train_x,1)*sum(delta2.*repmat(layer1(d,:),M,1),2)';
        end
        for m=1:M+1
            W2(m,:) = W2(m,:) - eta*1/size(train_x,1)*sum(delta.*repmat(layer2(:,m),K,1))';
        end
    end
    
end
% Mean Square Error with iteration on Training set
figure(1)
plot(1:iter,train_err,'rp-');
grid on;
xlabel('iteration');
ylabel('Mean Square Error');
title('Mean Square Error with iteration');

%% Testing
% Using training data
train_layer1 = [train_x ones(size(train_x,1),1)];
train_layer2 = [tanh((W1'*train_layer1')./2)' ones(size(train_x,1),1)]; %z=tanh(a);
train_t_hat = (W2'*train_layer2')';
train_err_mean = mean(train_t_hat - train_t);
train_err_std = std(train_t_hat - train_t);
fprintf('\nMean error on train set: ');
train_err_mean
fprintf('\nStandard deviation of prediction of train set:\n');
train_err_std
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


