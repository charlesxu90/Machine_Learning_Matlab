%% SVM
% This homework reads Wine+Quality Data from
% http://archive.ics.uci.edu/ml/datasets/Wine+Quality.
% This code is using built-in matlab svm functions
% Use cross-validation with 60% train and 40% test data to draw ROC
% Use ROC to compare different param settings.

clc;
clear all;
close all;
%% Read and Normalize data
data=csvread('winequality-white.csv',1,0);
x=data(:,1:11);
n=size(data,1);
% x=(x-repmat(mean(x),n,1))./repmat(std(x),n,1);
t=data(:,12);
t(t<=5)=-ones(size(find(t<=5)));
t(t>5)=ones(size(find(t>5)));

%% Split data into 5 sets
idx=crossvalind('Kfold',n,5);

% Parameters for training SVM
kkvl = 0.1;
opts = statset('MaxIter',30000);

%% cross-validation
miter=1;
linear_acy=zeros(miter,1);
linear_sv_s=zeros(miter,1);
linear_AUC1=zeros(miter,1);
poly_acy=zeros(miter,1);
poly_sv_s=zeros(miter,1);
poly_AUC1=zeros(miter,1);
rbf_acy=zeros(miter,1);
rbf_sv_s=zeros(miter,1);
rbf_AUC1=zeros(miter,1);
for fold=1:miter
    iter=fold;
    test_idx = find(idx==fold | idx==mod(fold+1,5));
    train_idx = find(idx~=fold & idx~=mod(fold+1,5));
    
    %% Train linear classifier
    linear_SVM1 = svmtrain(x(train_idx,:),t(train_idx),'kernel_function','linear','kktviolationlevel',kkvl,'options',opts);
    
    % Make a prediction for the test set
    shift = linear_SVM1.ScaleData.shift;
    scale = linear_SVM1.ScaleData.scaleFactor;
    test_x = bsxfun(@times,bsxfun(@plus,x(test_idx,:),shift),scale);
    
    pred = svmclassify(linear_SVM1, x(test_idx,:), 'Showplot',false);
    linear_acy(iter)=sum(pred==t(test_idx))/size(pred,1);
    
    linear_sv = linear_SVM1.SupportVectors;
    alphaHat = linear_SVM1.Alpha;
    bias = linear_SVM1.Bias;
    kfun = linear_SVM1.KernelFunction;
    kfunargs = linear_SVM1.KernelFunctionArgs;
    linear_sv_s(iter)=size(linear_sv,1);
    
    t_hat1 = -(kfun(linear_sv,test_x,kfunargs{:})'*alphaHat(:) + bias);
    [X,Y,~,linear_AUC1(iter)]=perfcurve(t(test_idx),t_hat1,1);
    if iter == miter
        plot(X,Y,'b')
        xlabel('False positive rate'); ylabel('True positive rate')
        title('ROC for classification by SVM')
        hold on
    end
    
    %% Train polynomial classifier
    poly_SVM1 = svmtrain(x(train_idx,:),t(train_idx),'kernel_function','polynomial','kktviolationlevel',kkvl,'options',opts);
    
    % Make a prediction for the test set
    shift = poly_SVM1.ScaleData.shift;
    scale = poly_SVM1.ScaleData.scaleFactor;
    test_x = bsxfun(@times,bsxfun(@plus,x(test_idx,:),shift),scale);
    
    pred = svmclassify(poly_SVM1, x(test_idx,:), 'Showplot',false);
    poly_acy(iter)=sum(pred==t(test_idx))/size(pred,1);
    
    poly_sv = poly_SVM1.SupportVectors;
    alphaHat = poly_SVM1.Alpha;
    bias = poly_SVM1.Bias;
    kfun = poly_SVM1.KernelFunction;
    kfunargs = poly_SVM1.KernelFunctionArgs;
    poly_sv_s(iter)=size(poly_sv,1);
    
    t_hat2 = -(kfun(poly_sv,test_x,kfunargs{:})'*alphaHat(:) + bias);
    [X,Y,~,poly_AUC1(iter)]=perfcurve(t(test_idx),t_hat2,1);
    if iter == miter
        plot(X,Y,'r')
        xlabel('False positive rate'); ylabel('True positive rate')
    end
    
    %% Train Gaussian Radial Basis Function kernel classifier
    rbf_SVM1 = svmtrain(x(train_idx,:),t(train_idx),'kernel_function','rbf','kktviolationlevel',kkvl,'options',opts);
    
    % Make a prediction for the test set
    shift = rbf_SVM1.ScaleData.shift;
    scale = rbf_SVM1.ScaleData.scaleFactor;
    test_x = bsxfun(@times,bsxfun(@plus,x(test_idx,:),shift),scale);
    
    pred = svmclassify(rbf_SVM1, x(test_idx,:), 'Showplot',false);
    rbf_acy(iter)=sum(pred==t(test_idx))/size(pred,1);
    
    rbf_sv = rbf_SVM1.SupportVectors;
    alphaHat = rbf_SVM1.Alpha;
    bias = rbf_SVM1.Bias;
    kfun = rbf_SVM1.KernelFunction;
    kfunargs = rbf_SVM1.KernelFunctionArgs;
    rbf_sv_s(iter)=size(rbf_sv,1);
    
    t_hat3 = -(kfun(rbf_sv,test_x,kfunargs{:})'*alphaHat(:) + bias);
    [X,Y,~,rbf_AUC1(iter)]=perfcurve(t(test_idx),t_hat3,1);
    if iter == miter
        plot(X,Y,'g')
        xlabel('False positive rate'); ylabel('True positive rate')
        legend('Linear Kernel','Polynomial Kernel','RBF Kernel')
    end
end

linear_sv_s_mean=mean(linear_sv_s)
poly_sv_s_mean=mean(poly_sv_s)
rbf_sv_s_mean=mean(rbf_sv_s)
linear_acy_mean=mean(linear_acy)
poly_acy_mean=mean(poly_acy)
rbf_acy_mean=mean(rbf_acy)
linear_AUC1_mean=mean(linear_AUC1)
poly_AUC1_mean=mean(poly_AUC1)
rbf_AUC1_mean=mean(rbf_AUC1)
