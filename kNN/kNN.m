%% This is for k Nearest Neibour algorithm
% Load data
close all;
clear;
clc;
options = 2;    % Type of target: 1 for binary, 2 for 3-class
numNB = 1;     % Number of neighboring samples
if options==1

    Train = importdata('logreg_data_binary.txt');
    n = size(Train,1);
%     Train(:,2:4) = (Train(:,2:4)-repmat(mean(Train(:,2:4)),size(Train,1),1))./repmat(std(Train(:,2:4)),size(Train,1),1);
    Test = importdata('test_data_binary.txt');
%     Test(:,2:4) = (Test(:,2:4)-repmat(mean(Train(:,2:4)),size(Test,1),1))./repmat(std(Train(:,2:4)),size(Test,1),1);

elseif options==2
    Train = importdata('logreg_data_3class.txt');
    n = size(Train,1);
%     Train(:,2:4) = (Train(:,2:4)-repmat(mean(Train(:,2:4)),size(Train,1),1))./repmat(std(Train(:,2:4)),size(Train,1),1);
    Test = importdata('test_data_3class.txt');
%     Test(:,2:4) = (Test(:,2:4)-repmat(mean(Train(:,2:4)),size(Test,1),1))./repmat(std(Train(:,2:4)),size(Test,1),1);
end

%% Run kNN using Standard Euclidean distance

if options==1
    
    for i=1:size(Test,1)
        dist=sum((repmat(Test(i,2:4),n,1)-Train(:,2:4)).^2,2);
        d_sort= sort(dist);
        idx=[];
        for j=1:numNB
            idx=[idx; find(dist==d_sort(j))];
            if size(idx)>= numNB
                break;
            end
        end
        T_knn(i,1)=mode(Train(idx,1));
    end
    
%     knn = ClassificationKNN.fit(Train(:,2:4),Train(:,1),'Distance','seuclidean','NumNeighbors',numNB);
%     T_knn = knn.predict(Test(:,2:4));
    
elseif options==2
    
    for i=1:size(Test,1)
        dist=sum((repmat(Test(i,2:4),n,1)-Train(:,2:4)).^2,2);
        d_sort= sort(dist);
        idx=[];
        for j=1:numNB
            idx=[idx; find(dist==d_sort(j))];
            if size(idx)>= numNB
                break;
            end
        end
        T_knn(i,1)=mode(Train(idx,1));
    end
%     knn = ClassificationKNN.fit(Train(:,2:4),Train(:,1),'Distance','seuclidean','NumNeighbors',numNB);
%     T_knn = knn.predict(Test(:,2:4));
    
end

%% The correctly predicted ratio
idx = find(T_knn-Test(:,1)==0);
true_ratio = size(idx,1)/size(Test(:,1),1)

