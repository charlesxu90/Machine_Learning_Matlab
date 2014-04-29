%% SVD feature selection + SVM
% This script use SVD for feature selection for SVM classification
% You need to *change* the *data folder* to make it run properly.
%% Load Datasets and Preprocessing
close all;
clear all
clc

faceDir = '/Users/charles/Documents/Programs/MATLAB/ML/MachineLearning/PCA_SVD/d_face';
planeDir = '/Users/charles/Documents/Programs/MATLAB/ML/MachineLearning/PCA_SVD/d_plane';

%% Read images, map it into grayscale, and resize it
width = 100; height = 100;
imageSet   = cell([], 1);

% Preprocessing for face images
% Read file name
k = dir(fullfile(faceDir,'*.jpg'));
k = {k(~[k.isdir]).name};

for j=1:length(k)
    % Read images
    tempImage  = imread(horzcat(faceDir,filesep,k{j}));
    imgInfo    = imfinfo(horzcat(faceDir,filesep,k{j}));
    
    % Transform into grayscale and resize
    if strcmp(imgInfo.ColorType,'grayscale') % Already Grayscale? Just resize
        imageSet{j} = double(imresize(tempImage,[width height]));
    else
        imageSet{j} = double(imresize(rgb2gray(tempImage),[width height]));
    end
end
% imagesc(DataSet{j})
% colormap(gray)
no_face = length(k); % Record how many are faces

% Preprocessing for plane images
% Read file name
k = dir(fullfile(planeDir,'*.jpg'));
k = {k(~[k.isdir]).name};

for j=1:length(k)
    % Read images
    tempImage  = imread(horzcat(planeDir,filesep,k{j}));
    imgInfo    = imfinfo(horzcat(planeDir,filesep,k{j}));
    
    % Transform into grayscale and resize
    if strcmp(imgInfo.ColorType,'grayscale') % If already Grayscale just resize
        imageSet{no_face+j} = double(imresize(tempImage,[width height]));
    else
        imageSet{no_face+j} = double(imresize(rgb2gray(tempImage),[width height]));
    end
end

%% Reshape the image matrices into arrays
dataSet=zeros(length(imageSet), 100*100);
for i=1:length(imageSet)
    dataSet(i,:)   = reshape(imageSet{i},1, 100*100);
end

%% Add label
label = [ones(1,no_face) zeros(1,size(dataSet,1)-no_face)]';
K=3;
TPR1=zeros(K,1);
TPR2=zeros(K,1);
SVNo2=zeros(K,1);
for k =1:K
    %% Cross Validation
    idx=crossvalind('Kfold',length(imageSet),5);
    train_idx=find(idx~=1);
    test_idx =find(idx==1);
    
    %% SVM without SVD feature selection
    SVMStruct1 = svmtrain(dataSet(train_idx,:), label(train_idx,:), 'kernel_function', 'linear');
    test_label_hat1 = svmclassify(SVMStruct1, dataSet(test_idx,:));
    TPR1(k)=size(find(label(test_idx,:)-test_label_hat1==0),1)/size(label(test_idx,:),1);
    
    %% SVM with SVD feature selection
    % SVD feature selection
    [U,S,V]=svd(dataSet-repmat(mean(dataSet),size(dataSet,1),1));
    % Select singularl components
    threshold = 0.95; % Threshold for selection of singular components
    sigval = zeros(size(S,1),1);
    for i = 1:size(S,1)
        sigval(i)= S(i,i);
    end
    
    i = 0;
    i_sigval_sum=0;
    while i_sigval_sum/sum(sigval) < threshold
        i=i+1;
        i_sigval_sum = i_sigval_sum + S(i,i);
    end
    SVNo2(k)=i;
    % SVD data reconstruction
    data_New=U(:,1:i)*S(1:i,1:i)*V(:,1:i)';
    data_hat=data_New*V(:,1:i);
    % Variance = dataSet-data_New;
    
    SVMStruct2 = svmtrain(data_hat(train_idx,:), label(train_idx,:), 'kernel_function', 'linear');
    test_label_hat2 = svmclassify(SVMStruct2, data_hat(test_idx,:));
    TPR2(k)=size(find(label(test_idx,:)-test_label_hat2==0),1)/size(label(test_idx,:),1);
end
SVNo2
mean(SVNo2)

TPR2
mean(TPR2)

TPR1
mean(TPR1)